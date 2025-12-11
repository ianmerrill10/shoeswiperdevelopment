-- ============================================
-- SHOESWIPER SEED DATA MIGRATION
-- Phase 2: Content Population
-- Generated: 2025-12-07T18:09:27.465Z
-- ============================================

-- clear existing data to prevent duplicates (optional, comment out if unwanted)
-- TRUNCATE TABLE public.shoes CASCADE;

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Force 1 ''07',
      'Nike Air Force 1 ''07',
      'men',
      ARRAY['classic', 'streetwear', 'timeless'],
      'sneakers',
      'White/White',
      'https://www.amazon.com/dp/B07QXLFLXT?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      115,
      true,
      true,
      1991,
      349,
      102,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Force 1 ''07 LV8',
      'Nike Air Force 1 ''07 LV8',
      'men',
      ARRAY['streetwear', 'casual', 'premium'],
      'sneakers',
      'Black/White',
      'https://www.amazon.com/dp/B0BYFDR63J?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      130,
      false,
      true,
      4546,
      65,
      132,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Force 1 Low',
      'Nike Air Force 1 Low',
      'women',
      ARRAY['classic', 'clean', 'everyday'],
      'sneakers',
      'White/White',
      'https://www.amazon.com/dp/B0CZR8VBXN?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      115,
      false,
      true,
      876,
      178,
      76,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Dunk Low Retro',
      'Nike Dunk Low Retro',
      'men',
      ARRAY['streetwear', 'casual', 'trendy'],
      'sneakers',
      'Black/White Panda',
      'https://www.amazon.com/dp/B09NLN47LP?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      115,
      true,
      true,
      3830,
      18,
      85,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Dunk Low Retro',
      'Nike Dunk Low Retro',
      'women',
      ARRAY['streetwear', 'trendy', 'clean'],
      'sneakers',
      'White/Black Panda',
      'https://www.amazon.com/dp/B08QBZFVY5?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      115,
      true,
      true,
      2702,
      168,
      11,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Dunk Low Next Nature',
      'Nike Dunk Low Next Nature',
      'women',
      ARRAY['sustainable', 'streetwear', 'trendy'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DWHRNVFN?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      115,
      false,
      true,
      1280,
      23,
      166,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'SB Dunk Low Pro',
      'Nike SB Dunk Low Pro',
      'men',
      ARRAY['skate', 'streetwear', 'casual'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B08P1KVDRB?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      120,
      false,
      true,
      3042,
      273,
      142,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Dunk High Retro',
      'Nike Dunk High Retro',
      'men',
      ARRAY['basketball', 'retro', 'streetwear'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DGKPZ6XN?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      125,
      false,
      true,
      2906,
      293,
      193,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max 90',
      'Nike Air Max 90',
      'men',
      ARRAY['retro', 'casual', 'classic'],
      'sneakers',
      'White/Black',
      'https://www.amazon.com/dp/B0DFVXG97P?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      130,
      false,
      true,
      3150,
      502,
      61,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max 90',
      'Nike Air Max 90',
      'women',
      ARRAY['retro', 'casual', 'classic'],
      'sneakers',
      'White/Pink',
      'https://www.amazon.com/dp/B0B1YDKWZW?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      130,
      false,
      true,
      4358,
      413,
      120,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max Plus',
      'Nike Air Max Plus',
      'men',
      ARRAY['streetwear', 'bold', 'chunky'],
      'sneakers',
      'Black/Volt',
      'https://www.amazon.com/dp/B0DSNF3FHZ?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      175,
      false,
      true,
      1941,
      393,
      79,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max 97',
      'Nike Air Max 97',
      'women',
      ARRAY['retro', 'metallic', 'bold'],
      'sneakers',
      'Silver Bullet',
      'https://www.amazon.com/dp/B08WPWWWQN?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      175,
      false,
      true,
      4065,
      45,
      35,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max 1',
      'Nike Air Max 1',
      'men',
      ARRAY['retro', 'classic', 'iconic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0D24HN2CB?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      140,
      false,
      true,
      3530,
      140,
      146,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air VaporMax Plus',
      'Nike Air VaporMax Plus',
      'men',
      ARRAY['futuristic', 'bold', 'streetwear'],
      'sneakers',
      'Black',
      'https://www.amazon.com/dp/B0DG4YWLZL?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      210,
      false,
      true,
      730,
      418,
      31,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max SC',
      'Nike Air Max SC',
      'women',
      ARRAY['casual', 'comfort', 'modern'],
      'sneakers',
      'White/Pink',
      'https://www.amazon.com/dp/B0F2G9G9H9?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      90,
      false,
      true,
      161,
      306,
      29,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Free Metcon 5',
      'Nike Free Metcon 5',
      'men',
      ARRAY['training', 'athletic', 'performance'],
      'sneakers',
      'Black/White',
      'https://www.amazon.com/dp/B0C7QHDR63?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      120,
      false,
      true,
      839,
      443,
      76,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Free Metcon 5',
      'Nike Free Metcon 5',
      'women',
      ARRAY['training', 'athletic', 'performance'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0BS6MTK41?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      120,
      false,
      true,
      707,
      391,
      17,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Vomero 18',
      'Nike Vomero 18',
      'men',
      ARRAY['running', 'comfort', 'athletic'],
      'sneakers',
      'Black/White',
      'https://www.amazon.com/dp/B0CVXHZ3VN?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      160,
      false,
      true,
      198,
      442,
      108,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Vomero 18',
      'Nike Vomero 18',
      'women',
      ARRAY['running', 'comfort', 'performance'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DYVSDM94?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      160,
      false,
      true,
      3412,
      50,
      200,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Pegasus 41',
      'Nike Pegasus 41',
      'men',
      ARRAY['running', 'performance', 'comfort'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0D2Q2VQVW?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      140,
      true,
      true,
      2807,
      139,
      156,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Pegasus 40',
      'Nike Pegasus 40',
      'women',
      ARRAY['running', 'comfort', 'everyday'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0BQZ4X73G?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      130,
      false,
      true,
      2355,
      272,
      101,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Zoom Vomero 5',
      'Nike Zoom Vomero 5',
      'men',
      ARRAY['chunky', 'techwear', 'retro'],
      'sneakers',
      'Photon Dust',
      'https://www.amazon.com/dp/B0D8PWWJ2R?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      160,
      true,
      true,
      3205,
      36,
      29,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Court Vision Low',
      'Nike Court Vision Low',
      'men',
      ARRAY['casual', 'clean', 'classic'],
      'sneakers',
      'White/Black',
      'https://www.amazon.com/dp/B07TFQSHMD?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      75,
      false,
      true,
      4350,
      461,
      64,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Court Vision Low',
      'Nike Court Vision Low',
      'women',
      ARRAY['casual', 'clean', 'everyday'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B0CZHQK1Q6?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      75,
      false,
      true,
      4902,
      26,
      94,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Court Vision Mid',
      'Nike Court Vision Mid',
      'women',
      ARRAY['casual', 'clean', 'classic'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B0F138FGJG?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      80,
      false,
      true,
      309,
      19,
      48,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Blazer Mid 77',
      'Nike Blazer Mid 77',
      'men',
      ARRAY['vintage', 'retro', 'casual'],
      'sneakers',
      'White/Black',
      'https://www.amazon.com/dp/B0949HSWCY?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      105,
      false,
      true,
      3154,
      117,
      131,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Blazer Mid ''77',
      'Nike Blazer Mid ''77',
      'women',
      ARRAY['vintage', 'retro', 'casual'],
      'sneakers',
      'White/Black',
      'https://www.amazon.com/dp/B0BYFBJKTL?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      105,
      false,
      true,
      296,
      408,
      13,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Cortez',
      'Nike Cortez',
      'women',
      ARRAY['retro', 'classic', 'vintage'],
      'sneakers',
      'White/Varsity Red',
      'https://www.amazon.com/dp/B0D1YFHNNK?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      90,
      false,
      true,
      3067,
      410,
      182,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Waffle Debut',
      'Nike Waffle Debut',
      'women',
      ARRAY['retro', 'casual', 'vintage'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B09NMHN3Q2?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      75,
      false,
      true,
      1317,
      202,
      142,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'V2K Run',
      'Nike V2K Run',
      'women',
      ARRAY['running', 'retro', 'chunky'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0CQGS72QF?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      110,
      false,
      true,
      1348,
      63,
      141,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '1 Retro High OG',
      'Jordan 1 Retro High OG',
      'men',
      ARRAY['basketball', 'hypebeast', 'iconic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DBHRM6VR?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      180,
      true,
      true,
      5077,
      157,
      86,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Low',
      'Jordan Air Jordan 1 Low',
      'men',
      ARRAY['streetwear', 'casual', 'classic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0D5T1HXPC?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      115,
      false,
      true,
      3144,
      267,
      99,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Low',
      'Jordan Air Jordan 1 Low',
      'women',
      ARRAY['streetwear', 'casual', 'classic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0C3JM5YD8?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      115,
      false,
      true,
      4810,
      424,
      42,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Mid',
      'Jordan Air Jordan 1 Mid',
      'men',
      ARRAY['streetwear', 'casual', 'classic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DTXVK65V?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      135,
      false,
      true,
      3971,
      165,
      175,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Mid',
      'Jordan Air Jordan 1 Mid',
      'women',
      ARRAY['streetwear', 'casual', 'classic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DS6LV8BT?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      135,
      false,
      true,
      542,
      476,
      48,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '1 Retro Low Satin',
      'Jordan 1 Retro Low Satin',
      'women',
      ARRAY['streetwear', 'satin', 'premium'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DJTHZB95?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      140,
      false,
      true,
      1591,
      211,
      55,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Low SE',
      'Jordan Air Jordan 1 Low SE',
      'women',
      ARRAY['streetwear', 'special edition', 'premium'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DZVGK3DP?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      125,
      false,
      true,
      4401,
      366,
      162,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '3 Retro',
      'Jordan 3 Retro',
      'men',
      ARRAY['basketball', 'iconic', 'elephant print'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DJC4C5DK?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      200,
      false,
      true,
      2242,
      354,
      110,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '4 Retro',
      'Jordan 4 Retro',
      'men',
      ARRAY['basketball', 'hypebeast', 'chunky'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DJC5VP3Q?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      215,
      true,
      true,
      535,
      382,
      38,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '4 Retro',
      'Jordan 4 Retro',
      'women',
      ARRAY['basketball', 'chunky', 'bold'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0F9FVF4BZ?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      215,
      true,
      true,
      4985,
      267,
      11,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '11 Retro',
      'Jordan 11 Retro',
      'men',
      ARRAY['basketball', 'luxury', 'iconic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DLBGPGFX?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      225,
      true,
      true,
      1874,
      206,
      104,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '12 Retro',
      'Jordan 12 Retro',
      'men',
      ARRAY['basketball', 'luxury', 'bold'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DP61V59T?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      200,
      false,
      true,
      146,
      365,
      144,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Spizike Low',
      'Jordan Spizike Low',
      'men',
      ARRAY['basketball', 'hybrid', 'bold'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DGZ7BT7R?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      160,
      false,
      true,
      224,
      455,
      162,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Max Aura 5',
      'Jordan Max Aura 5',
      'men',
      ARRAY['basketball', 'casual', 'comfort'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0CMVBKJJV?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      130,
      false,
      true,
      238,
      458,
      136,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Max Aura 4',
      'Jordan Max Aura 4',
      'women',
      ARRAY['basketball', 'casual', 'comfort'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B093CC4LKQ?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      120,
      false,
      true,
      1766,
      88,
      171,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Stay Loyal 3',
      'Jordan Stay Loyal 3',
      'men',
      ARRAY['basketball', 'casual', 'modern'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0D5RX5KVS?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      false,
      true,
      4136,
      202,
      21,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Stadium 90',
      'Jordan Stadium 90',
      'women',
      ARRAY['modern', 'casual', 'comfort'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DC6ZGC85?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      110,
      false,
      true,
      3589,
      491,
      98,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Delta 3 Low',
      'Jordan Delta 3 Low',
      'women',
      ARRAY['modern', 'lifestyle', 'comfort'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0BZF531LC?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      130,
      false,
      true,
      1122,
      386,
      113,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Samba OG',
      'Adidas Samba OG',
      'men',
      ARRAY['vintage', 'casual', 'timeless'],
      'sneakers',
      'White/Black',
      'https://www.amazon.com/dp/B0C37GPXQ9?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      true,
      true,
      2398,
      99,
      89,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Samba OG',
      'Adidas Samba OG',
      'women',
      ARRAY['vintage', 'casual', 'timeless'],
      'sneakers',
      'White/Black',
      'https://www.amazon.com/dp/B0C2JXJS3M?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      true,
      true,
      1181,
      402,
      51,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Gazelle',
      'Adidas Gazelle',
      'men',
      ARRAY['vintage', 'casual', 'retro'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B09P86BPCR?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      false,
      true,
      3820,
      361,
      119,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Gazelle',
      'Adidas Gazelle',
      'women',
      ARRAY['vintage', 'casual', 'retro'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0C2JY6GCT?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      false,
      true,
      698,
      140,
      47,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Forum Low',
      'Adidas Forum Low',
      'men',
      ARRAY['retro', 'basketball', 'classic'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B08745PCHW?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      110,
      false,
      true,
      371,
      31,
      91,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Forum Low',
      'Adidas Forum Low',
      'women',
      ARRAY['retro', 'basketball', 'classic'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B09DXWJPHY?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      110,
      false,
      true,
      3531,
      424,
      97,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court',
      'Adidas Grand Court',
      'men',
      ARRAY['casual', 'clean', 'tennis'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B09DXW3D8B?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      70,
      false,
      true,
      3486,
      142,
      144,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court',
      'Adidas Grand Court',
      'women',
      ARRAY['casual', 'clean', 'everyday'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B09DXW115R?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      70,
      false,
      true,
      656,
      434,
      70,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court Alpha',
      'Adidas Grand Court Alpha',
      'men',
      ARRAY['casual', 'modern', 'clean'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B0D2S69CWQ?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      75,
      false,
      true,
      787,
      302,
      92,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court Tennis',
      'Adidas Grand Court Tennis',
      'men',
      ARRAY['tennis', 'casual', 'sport'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B09DXVXBFR?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      65,
      false,
      true,
      104,
      65,
      75,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court Tennis',
      'Adidas Grand Court Tennis',
      'women',
      ARRAY['tennis', 'casual', 'clean'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B09DXVKGTW?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      65,
      false,
      true,
      594,
      346,
      43,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Ultraboost',
      'Adidas Ultraboost',
      'men',
      ARRAY['running', 'comfort', 'performance'],
      'sneakers',
      'Black/White',
      'https://www.amazon.com/dp/B0D3P29Q5C?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      190,
      true,
      true,
      2699,
      312,
      37,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Ultraboost',
      'Adidas Ultraboost',
      'women',
      ARRAY['running', 'comfort', 'performance'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DJV2FSHF?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      190,
      false,
      true,
      260,
      134,
      145,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Swift Run',
      'Adidas Swift Run',
      'men',
      ARRAY['running', 'casual', 'lightweight'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0BHPVPF4H?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      85,
      false,
      true,
      939,
      454,
      53,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Handball Spezial',
      'Adidas Handball Spezial',
      'men',
      ARRAY['vintage', 'terrace', 'classic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0D7HMS8S2?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      false,
      true,
      238,
      479,
      52,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Streetalk',
      'Adidas Streetalk',
      'men',
      ARRAY['streetwear', 'modern', 'bold'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DJV38CBT?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      90,
      false,
      true,
      3058,
      161,
      92,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Campus 00s',
      'Adidas Campus 00s',
      'women',
      ARRAY['retro', 'casual', 'suede'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0FRYDBBHN?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      false,
      true,
      729,
      378,
      90,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Ozweego',
      'Adidas Ozweego',
      'women',
      ARRAY['chunky', 'retro', 'bold'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0989C9VGQ?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      120,
      false,
      true,
      2424,
      345,
      32,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '550',
      'New Balance 550',
      'men',
      ARRAY['retro', 'basketball', 'trendy'],
      'sneakers',
      'White/Green',
      'https://www.amazon.com/dp/B0DCX24RNV?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      130,
      true,
      true,
      2703,
      166,
      193,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '550',
      'New Balance 550',
      'women',
      ARRAY['retro', 'basketball', 'trendy'],
      'sneakers',
      'White/Green',
      'https://www.amazon.com/dp/B0C9W3BLT3?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      130,
      true,
      true,
      920,
      69,
      203,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '574 Core',
      'New Balance 574 Core',
      'men',
      ARRAY['classic', 'casual', 'comfort'],
      'sneakers',
      'Grey',
      'https://www.amazon.com/dp/B093QJF4VR?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      90,
      false,
      true,
      4307,
      314,
      135,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '574',
      'New Balance 574',
      'women',
      ARRAY['classic', 'casual', 'comfort'],
      'sneakers',
      'Grey',
      'https://www.amazon.com/dp/B093QK8S8R?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      90,
      false,
      true,
      777,
      82,
      46,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'FuelCell',
      'New Balance FuelCell',
      'men',
      ARRAY['running', 'performance', 'speed'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B096NND25R?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      160,
      false,
      true,
      4045,
      463,
      127,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '2002R',
      'New Balance 2002R',
      'men',
      ARRAY['retro', 'chunky', 'comfort'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0FN5CXB8M?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      150,
      false,
      true,
      2868,
      330,
      87,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '327',
      'New Balance 327',
      'men',
      ARRAY['retro', 'bold', 'casual'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B099TFD8W5?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      false,
      true,
      1437,
      395,
      193,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '327',
      'New Balance 327',
      'women',
      ARRAY['retro', 'bold', 'casual'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0FCWDLYF3?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      false,
      true,
      208,
      274,
      18,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '530',
      'New Balance 530',
      'men',
      ARRAY['retro', 'running', 'chunky'],
      'sneakers',
      'White/Silver',
      'https://www.amazon.com/dp/B07B3VM8D2?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      false,
      true,
      1787,
      491,
      159,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '530',
      'New Balance 530',
      'women',
      ARRAY['retro', 'running', 'chunky'],
      'sneakers',
      'White/Silver',
      'https://www.amazon.com/dp/B0CQQDW6B8?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      100,
      false,
      true,
      526,
      90,
      72,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '1906R',
      'New Balance 1906R',
      'unisex',
      ARRAY['retro', 'chunky', 'premium'],
      'sneakers',
      'Silver',
      'https://www.amazon.com/dp/B0C8BT9P9S?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      150,
      false,
      true,
      3041,
      51,
      138,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '9060',
      'New Balance 9060',
      'women',
      ARRAY['chunky', 'futuristic', 'bold'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DSX47PJ1?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      150,
      false,
      true,
      3027,
      177,
      46,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'Fresh Foam X 1080v13',
      'New Balance Fresh Foam X 1080v13',
      'men',
      ARRAY['running', 'comfort', 'premium'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0CNKXG21F?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      165,
      false,
      true,
      4459,
      418,
      173,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'Fresh Foam X 880',
      'New Balance Fresh Foam X 880',
      'men',
      ARRAY['running', 'comfort', 'stability'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0C34VNVJ6?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      140,
      false,
      true,
      3155,
      463,
      183,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'Fresh Foam X 880v14',
      'New Balance Fresh Foam X 880v14',
      'women',
      ARRAY['running', 'comfort', 'stability'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0CLBB3WLL?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      140,
      false,
      true,
      1565,
      414,
      73,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'Cross Trainer',
      'New Balance Cross Trainer',
      'women',
      ARRAY['training', 'comfort', 'athletic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B07B41SLY5?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      70,
      false,
      true,
      1182,
      377,
      172,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Converse',
      'Chuck Taylor All Star High',
      'Converse Chuck Taylor All Star High',
      'unisex',
      ARRAY['classic', 'vintage', 'iconic'],
      'sneakers',
      'Black',
      'https://www.amazon.com/dp/B000OLRWO2?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      65,
      true,
      true,
      4136,
      391,
      173,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Converse',
      'Chuck Taylor All Star',
      'Converse Chuck Taylor All Star',
      'women',
      ARRAY['classic', 'vintage', 'casual'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B09SBRZMLT?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      60,
      false,
      true,
      3973,
      170,
      169,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Converse',
      'Chuck Taylor',
      'Converse Chuck Taylor',
      'women',
      ARRAY['classic', 'vintage', 'iconic'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B07BTCBV5Q?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      55,
      false,
      true,
      1152,
      13,
      51,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Vans',
      'Brooklyn Low Top',
      'Vans Brooklyn Low Top',
      'men',
      ARRAY['skate', 'casual', 'streetwear'],
      'sneakers',
      'Black',
      'https://www.amazon.com/dp/B0D7QC25H7?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      70,
      false,
      true,
      2947,
      437,
      193,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Vans',
      'Brooklyn Low Top',
      'Vans Brooklyn Low Top',
      'women',
      ARRAY['skate', 'casual', 'streetwear'],
      'sneakers',
      'Black',
      'https://www.amazon.com/dp/B0D7QFMK5N?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      70,
      false,
      true,
      622,
      293,
      155,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Vans',
      'Filmore',
      'Vans Filmore',
      'men',
      ARRAY['skate', 'casual', 'classic'],
      'sneakers',
      'Black/White',
      'https://www.amazon.com/dp/B0949M2KTN?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      60,
      false,
      true,
      5045,
      139,
      50,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Vans',
      'Ashwood',
      'Vans Ashwood',
      'women',
      ARRAY['casual', 'modern', 'lifestyle'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DQ1G5ZQ3?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      75,
      false,
      true,
      4876,
      479,
      84,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Puma',
      'Suede Classic',
      'Puma Suede Classic',
      'men',
      ARRAY['retro', 'casual', 'hip-hop'],
      'sneakers',
      'Black',
      'https://www.amazon.com/dp/B0D32JWHM5?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      75,
      false,
      true,
      2581,
      239,
      204,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Puma',
      'Suede Classic',
      'Puma Suede Classic',
      'women',
      ARRAY['retro', 'casual', 'hip-hop'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0D7DVSQ37?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      75,
      false,
      true,
      2105,
      378,
      102,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Puma',
      'Whispers',
      'Puma Whispers',
      'men',
      ARRAY['modern', 'casual', 'sleek'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0FBHV4RFD?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      85,
      false,
      true,
      3746,
      431,
      68,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Puma',
      'Carina',
      'Puma Carina',
      'women',
      ARRAY['casual', 'platform', 'trendy'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B07HJRV1YQ?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      55,
      false,
      true,
      3947,
      354,
      144,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Reebok',
      'Club C Vintage',
      'Reebok Club C Vintage',
      'men',
      ARRAY['retro', 'tennis', 'clean'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B07DPD5NS4?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      80,
      false,
      true,
      586,
      207,
      169,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Reebok',
      'Classic Leather',
      'Reebok Classic Leather',
      'men',
      ARRAY['classic', 'retro', 'timeless'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B0971NHH8G?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      85,
      false,
      true,
      3260,
      37,
      140,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Reebok',
      'Classic Leather',
      'Reebok Classic Leather',
      'women',
      ARRAY['classic', 'retro', 'timeless'],
      'sneakers',
      'White',
      'https://www.amazon.com/dp/B092YWBZ4F?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      85,
      false,
      true,
      1670,
      402,
      57,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'ASICS',
      'Gel-Kayano 14',
      'ASICS Gel-Kayano 14',
      'men',
      ARRAY['retro', 'running', 'techwear'],
      'sneakers',
      'Silver',
      'https://www.amazon.com/dp/B0CMHXJWWN?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      150,
      true,
      true,
      869,
      65,
      50,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'ASICS',
      'Gel-1130',
      'ASICS Gel-1130',
      'women',
      ARRAY['retro', 'running', 'chunky'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0D82BRSYZ?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      120,
      false,
      true,
      3818,
      45,
      68,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'ASICS',
      'Gel-1130',
      'ASICS Gel-1130',
      'women',
      ARRAY['retro', 'running', 'techwear'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0D82FZ11P?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      120,
      false,
      true,
      152,
      387,
      177,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'On',
      'Cloud 5',
      'On Cloud 5',
      'men',
      ARRAY['running', 'swiss', 'premium'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0D31TNKHB?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      150,
      false,
      true,
      3589,
      75,
      110,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Brooks',
      'Ghost',
      'Brooks Ghost',
      'men',
      ARRAY['running', 'comfort', 'neutral'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B0DQ2BMHDW?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      140,
      false,
      true,
      1052,
      453,
      32,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Skechers',
      'Go Walk Max',
      'Skechers Go Walk Max',
      'men',
      ARRAY['comfort', 'walking', 'casual'],
      'sneakers',
      'Black',
      'https://www.amazon.com/dp/B072KVD3WD?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      70,
      false,
      true,
      778,
      464,
      112,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Birkenstock',
      'Boston Clog',
      'Birkenstock Boston Clog',
      'unisex',
      ARRAY['comfort', 'casual', 'classic'],
      'sneakers',
      'Brown',
      'https://www.amazon.com/dp/B004S998FW?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      160,
      false,
      true,
      2013,
      172,
      61,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Birkenstock',
      'Boston Shearling',
      'Birkenstock Boston Shearling',
      'women',
      ARRAY['comfort', 'cozy', 'winter'],
      'sneakers',
      'Various',
      'https://www.amazon.com/dp/B08CRZLHLJ?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      180,
      false,
      true,
      3256,
      397,
      29,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, full_name, gender, style_tags, category, colorway,
      amazon_url, image_url, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'DKNY',
      'Jaysha Heeled',
      'DKNY Jaysha Heeled',
      'women',
      ARRAY['fashion', 'heeled', 'luxury'],
      'sneakers',
      'Black',
      'https://www.amazon.com/dp/B0BPZWJRB4?tag=shoeswiper-20',
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
      130,
      false,
      true,
      3916,
      244,
      187,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

-- ============================================
-- VERIFICATION
-- ============================================
-- SELECT count(*) FROM shoes;