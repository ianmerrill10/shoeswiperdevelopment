-- ============================================
-- SHOESWIPER DATABASE SCHEMA
-- Supabase PostgreSQL
-- ============================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- CORE TABLES
-- ============================================

-- Shoes / Products table
CREATE TABLE IF NOT EXISTS shoes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  brand TEXT NOT NULL,
  category_slug TEXT,
  
  -- Pricing
  price DECIMAL(10,2),
  retail_price DECIMAL(10,2),
  sale_price DECIMAL(10,2),
  currency TEXT DEFAULT 'USD',
  price_last_updated TIMESTAMPTZ,
  
  -- Media & Affiliate
  image_url TEXT NOT NULL,
  amazon_url TEXT NOT NULL,
  amazon_asin TEXT NOT NULL,
  
  -- Product Details
  colorway TEXT,
  style_code TEXT,
  
  -- Attributes
  style_tags TEXT[] DEFAULT '{}',
  color_tags TEXT[] DEFAULT '{}',
  gender TEXT CHECK (gender IN ('men', 'women', 'unisex', 'kids')),
  sizes_available TEXT[] DEFAULT '{}',
  release_date DATE,
  description TEXT,
  
  -- Metrics
  favorite_count INTEGER DEFAULT 0,
  view_count INTEGER DEFAULT 0,
  click_count INTEGER DEFAULT 0,
  vibe_score INTEGER,
  
  -- Status
  is_active BOOLEAN DEFAULT true,
  is_featured BOOLEAN DEFAULT false,
  stock_status TEXT CHECK (stock_status IN ('in_stock', 'low_stock', 'out_of_stock')),
  
  -- Timestamps
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for common queries
CREATE INDEX IF NOT EXISTS idx_shoes_brand ON shoes(brand);
CREATE INDEX IF NOT EXISTS idx_shoes_gender ON shoes(gender);
CREATE INDEX IF NOT EXISTS idx_shoes_is_active ON shoes(is_active);
CREATE INDEX IF NOT EXISTS idx_shoes_is_featured ON shoes(is_featured);
CREATE INDEX IF NOT EXISTS idx_shoes_style_tags ON shoes USING GIN(style_tags);
CREATE INDEX IF NOT EXISTS idx_shoes_color_tags ON shoes USING GIN(color_tags);
CREATE INDEX IF NOT EXISTS idx_shoes_amazon_asin ON shoes(amazon_asin);

-- ============================================
-- USER PROFILES
-- ============================================

CREATE TABLE IF NOT EXISTS profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT,
  username TEXT,
  avatar_url TEXT,
  bio TEXT,
  style_tags TEXT[] DEFAULT '{}',
  is_banned BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Auto-create profile on user signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, username)
  VALUES (NEW.id, NEW.email, COALESCE(NEW.raw_user_meta_data->>'name', split_part(NEW.email, '@', 1)));
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============================================
-- USER SNEAKERS (Favorites & Closet)
-- ============================================

CREATE TABLE IF NOT EXISTS user_sneakers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  shoe_id UUID NOT NULL REFERENCES shoes(id) ON DELETE CASCADE,
  is_favorite BOOLEAN DEFAULT true,
  is_in_closet BOOLEAN DEFAULT false,
  added_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, shoe_id)
);

CREATE INDEX IF NOT EXISTS idx_user_sneakers_user ON user_sneakers(user_id);
CREATE INDEX IF NOT EXISTS idx_user_sneakers_shoe ON user_sneakers(shoe_id);

-- ============================================
-- EMAIL SUBSCRIPTIONS
-- ============================================

CREATE TABLE IF NOT EXISTS email_subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT NOT NULL UNIQUE,
  source TEXT CHECK (source IN ('price_alert', 'newsletter', 'exit_intent', 'referral')),
  shoe_id UUID REFERENCES shoes(id) ON DELETE SET NULL,
  shoe_name TEXT,
  preferences JSONB DEFAULT '{"priceAlerts": true, "newReleases": true, "weeklyDigest": false, "promotions": false}',
  is_subscribed BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_email_subscriptions_email ON email_subscriptions(email);

-- ============================================
-- REFERRALS
-- ============================================

CREATE TABLE IF NOT EXISTS user_referrals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  code TEXT NOT NULL UNIQUE,
  referred_by TEXT,
  total_shares INTEGER DEFAULT 0,
  total_clicks INTEGER DEFAULT 0,
  total_signups INTEGER DEFAULT 0,
  earned_rewards INTEGER DEFAULT 0,
  pending_rewards INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_user_referrals_code ON user_referrals(code);
CREATE INDEX IF NOT EXISTS idx_user_referrals_user ON user_referrals(user_id);

-- RPC function to increment shares
CREATE OR REPLACE FUNCTION increment_referral_shares(p_user_id UUID)
RETURNS VOID AS $$
BEGIN
  UPDATE user_referrals SET total_shares = total_shares + 1 WHERE user_id = p_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- RPC function to track clicks
CREATE OR REPLACE FUNCTION track_referral_click(referrer_code TEXT)
RETURNS VOID AS $$
BEGIN
  UPDATE user_referrals SET total_clicks = total_clicks + 1 WHERE code = referrer_code;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- RPC function to process signup
CREATE OR REPLACE FUNCTION process_referral_signup(referrer_code TEXT, new_user_id UUID)
RETURNS VOID AS $$
BEGIN
  -- Update referrer stats
  UPDATE user_referrals 
  SET total_signups = total_signups + 1, 
      pending_rewards = pending_rewards + 100
  WHERE code = referrer_code;
  
  -- Mark new user as referred
  UPDATE user_referrals SET referred_by = referrer_code WHERE user_id = new_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================
-- NFT TOKENS
-- ============================================

CREATE TABLE IF NOT EXISTS nft_tokens (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  sneaker_id UUID NOT NULL REFERENCES shoes(id) ON DELETE CASCADE,
  owner_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  token_id TEXT NOT NULL UNIQUE,
  rarity TEXT CHECK (rarity IN ('common', 'rare', 'legendary', 'grail')) DEFAULT 'common',
  minted_at TIMESTAMPTZ DEFAULT NOW(),
  for_sale BOOLEAN DEFAULT false,
  price_eth DECIMAL(18,8),
  auction_end TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS idx_nft_tokens_owner ON nft_tokens(owner_id);
CREATE INDEX IF NOT EXISTS idx_nft_tokens_sneaker ON nft_tokens(sneaker_id);
CREATE INDEX IF NOT EXISTS idx_nft_tokens_for_sale ON nft_tokens(for_sale);

-- NFT ownership history
CREATE TABLE IF NOT EXISTS nft_ownership_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nft_id UUID NOT NULL REFERENCES nft_tokens(id) ON DELETE CASCADE,
  from_user UUID REFERENCES profiles(id),
  to_user UUID NOT NULL REFERENCES profiles(id),
  price_eth DECIMAL(18,8),
  transferred_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- AFFILIATE CLICKS (Analytics)
-- ============================================

CREATE TABLE IF NOT EXISTS affiliate_clicks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  shoe_id UUID NOT NULL REFERENCES shoes(id) ON DELETE CASCADE,
  user_id UUID REFERENCES profiles(id) ON DELETE SET NULL,
  clicked_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_affiliate_clicks_shoe ON affiliate_clicks(shoe_id);
CREATE INDEX IF NOT EXISTS idx_affiliate_clicks_date ON affiliate_clicks(clicked_at);

-- ============================================
-- PRICE ALERTS
-- ============================================

CREATE TABLE IF NOT EXISTS price_alerts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  shoe_id UUID NOT NULL REFERENCES shoes(id) ON DELETE CASCADE,
  target_price DECIMAL(10,2) NOT NULL,
  is_active BOOLEAN DEFAULT true,
  triggered_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, shoe_id)
);

CREATE INDEX IF NOT EXISTS idx_price_alerts_active ON price_alerts(is_active);

-- ============================================
-- PRICE HISTORY
-- ============================================

CREATE TABLE IF NOT EXISTS price_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  shoe_id UUID NOT NULL REFERENCES shoes(id) ON DELETE CASCADE,
  price DECIMAL(10,2) NOT NULL,
  recorded_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_price_history_shoe ON price_history(shoe_id);
CREATE INDEX IF NOT EXISTS idx_price_history_date ON price_history(recorded_at);

-- ============================================
-- AUDIT LOGS (Admin)
-- ============================================

CREATE TABLE IF NOT EXISTS audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  admin_email TEXT NOT NULL,
  action TEXT NOT NULL,
  target_table TEXT NOT NULL,
  target_id TEXT,
  details JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_audit_logs_date ON audit_logs(created_at);

-- ============================================
-- BLOG POSTS
-- ============================================

CREATE TABLE IF NOT EXISTS blog_posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  excerpt TEXT,
  content TEXT NOT NULL,
  cover_image TEXT,
  author_id UUID REFERENCES profiles(id),
  category TEXT,
  tags TEXT[] DEFAULT '{}',
  is_published BOOLEAN DEFAULT false,
  published_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_blog_posts_slug ON blog_posts(slug);
CREATE INDEX IF NOT EXISTS idx_blog_posts_published ON blog_posts(is_published);

-- ============================================
-- ROW LEVEL SECURITY
-- ============================================

-- Enable RLS on all tables
ALTER TABLE shoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_sneakers ENABLE ROW LEVEL SECURITY;
ALTER TABLE email_subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_referrals ENABLE ROW LEVEL SECURITY;
ALTER TABLE nft_tokens ENABLE ROW LEVEL SECURITY;
ALTER TABLE affiliate_clicks ENABLE ROW LEVEL SECURITY;
ALTER TABLE price_alerts ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE blog_posts ENABLE ROW LEVEL SECURITY;

-- Shoes: Public read, admin write
CREATE POLICY "Shoes are viewable by everyone" ON shoes FOR SELECT USING (is_active = true);
CREATE POLICY "Admins can manage shoes" ON shoes FOR ALL USING (
  EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND email = 'ianmerrill10@gmail.com')
);

-- Profiles: Users can read all, update own
CREATE POLICY "Profiles are viewable by everyone" ON profiles FOR SELECT USING (true);
CREATE POLICY "Users can update own profile" ON profiles FOR UPDATE USING (auth.uid() = id);

-- User sneakers: Users manage their own
CREATE POLICY "Users can manage own sneakers" ON user_sneakers FOR ALL USING (auth.uid() = user_id);

-- Email subscriptions: Users manage their own
CREATE POLICY "Users can manage own subscriptions" ON email_subscriptions FOR ALL USING (true);

-- Referrals: Users manage their own
CREATE POLICY "Users can view own referrals" ON user_referrals FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can update own referrals" ON user_referrals FOR UPDATE USING (auth.uid() = user_id);

-- NFTs: Public read, owners manage
CREATE POLICY "NFTs are viewable by everyone" ON nft_tokens FOR SELECT USING (true);
CREATE POLICY "Owners can manage NFTs" ON nft_tokens FOR ALL USING (auth.uid() = owner_id);

-- Affiliate clicks: Insert only
CREATE POLICY "Anyone can log clicks" ON affiliate_clicks FOR INSERT WITH CHECK (true);
CREATE POLICY "Admins can view clicks" ON affiliate_clicks FOR SELECT USING (
  EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND email = 'ianmerrill10@gmail.com')
);

-- Price alerts: Users manage their own
CREATE POLICY "Users can manage own alerts" ON price_alerts FOR ALL USING (auth.uid() = user_id);

-- Audit logs: Admin only
CREATE POLICY "Admins can view audit logs" ON audit_logs FOR SELECT USING (
  EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND email = 'ianmerrill10@gmail.com')
);
CREATE POLICY "Admins can insert audit logs" ON audit_logs FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND email = 'ianmerrill10@gmail.com')
);

-- Blog posts: Public read published, admin write
CREATE POLICY "Published posts are viewable" ON blog_posts FOR SELECT USING (is_published = true);
CREATE POLICY "Admins can manage posts" ON blog_posts FOR ALL USING (
  EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND email = 'ianmerrill10@gmail.com')
);

-- ============================================
-- HELPER FUNCTIONS
-- ============================================

-- Toggle favorite function
CREATE OR REPLACE FUNCTION toggle_favorite(p_user_id UUID, p_shoe_id UUID)
RETURNS TABLE(action TEXT, is_favorited BOOLEAN, new_favorite_count INTEGER) AS $$
DECLARE
  v_exists BOOLEAN;
  v_count INTEGER;
BEGIN
  SELECT EXISTS(SELECT 1 FROM user_sneakers WHERE user_id = p_user_id AND shoe_id = p_shoe_id AND is_favorite = true) INTO v_exists;
  
  IF v_exists THEN
    DELETE FROM user_sneakers WHERE user_id = p_user_id AND shoe_id = p_shoe_id AND is_favorite = true AND is_in_closet = false;
    UPDATE user_sneakers SET is_favorite = false WHERE user_id = p_user_id AND shoe_id = p_shoe_id;
    UPDATE shoes SET favorite_count = favorite_count - 1 WHERE id = p_shoe_id;
    SELECT favorite_count INTO v_count FROM shoes WHERE id = p_shoe_id;
    RETURN QUERY SELECT 'removed'::TEXT, false, v_count;
  ELSE
    INSERT INTO user_sneakers (user_id, shoe_id, is_favorite) 
    VALUES (p_user_id, p_shoe_id, true)
    ON CONFLICT (user_id, shoe_id) DO UPDATE SET is_favorite = true;
    UPDATE shoes SET favorite_count = favorite_count + 1 WHERE id = p_shoe_id;
    SELECT favorite_count INTO v_count FROM shoes WHERE id = p_shoe_id;
    RETURN QUERY SELECT 'added'::TEXT, true, v_count;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Increment view count
CREATE OR REPLACE FUNCTION increment_view_count(p_shoe_id UUID)
RETURNS VOID AS $$
BEGIN
  UPDATE shoes SET view_count = view_count + 1 WHERE id = p_shoe_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Log affiliate click
CREATE OR REPLACE FUNCTION log_affiliate_click(p_shoe_id UUID, p_user_id UUID DEFAULT NULL)
RETURNS VOID AS $$
BEGIN
  INSERT INTO affiliate_clicks (shoe_id, user_id) VALUES (p_shoe_id, p_user_id);
  UPDATE shoes SET click_count = click_count + 1 WHERE id = p_shoe_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================
-- DONE!
-- ============================================
