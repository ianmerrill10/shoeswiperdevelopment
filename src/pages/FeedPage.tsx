import React, { useEffect, useState, useRef, useCallback, useMemo } from 'react';
import { FaHeart, FaShare, FaBookmark, FaAmazon, FaMusic, FaCheck, FaBell, FaFire } from 'react-icons/fa';
import { useSneakers } from '../hooks/useSneakers';
import { useAnalytics } from '../hooks/useAnalytics';
import { useFavorites } from '../hooks/useFavorites';
import { usePriceAlerts } from '../hooks/usePriceAlerts';
import { useUIStore } from '../store';
import { getAffiliateUrl, shouldShowPrice, formatPrice } from '../lib/supabaseClient';
import { createAffiliateShareData } from '../lib/deepLinks';
import { Shoe } from '../lib/types';
import ShoePanel from '../components/ShoePanel';
import MusicPanel from '../components/MusicPanel';
import NotificationsPanel from '../components/NotificationsPanel';
import ExitIntentPopup from '../components/ExitIntentPopup';

type FeedTab = 'foryou' | 'trending';

const FeedPage: React.FC = () => {
  const { getInfiniteFeed, trackView, trackClick, loading } = useSneakers();
  const { trackPanelOpen, trackShare, trackFavorite, trackShoeClick } = useAnalytics();
  const { toggleFavorite, isFavorite } = useFavorites();
  const { unreadCount } = usePriceAlerts();
  const {
    isShoePanelOpen,
    isMusicPanelOpen,
    isNotificationsPanelOpen,
    openShoePanel,
    closeShoePanel,
    openMusicPanel,
    closeMusicPanel,
    openNotificationsPanel,
    closeNotificationsPanel,
  } = useUIStore();
  const [shoes, setShoes] = useState<Shoe[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [page, setPage] = useState(0);
  const [showShareToast, setShowShareToast] = useState(false);
  const [activeTab, setActiveTab] = useState<FeedTab>('foryou');
  const [hasAutoOpenedMusic, setHasAutoOpenedMusic] = useState(false);
  const containerRef = useRef<HTMLDivElement>(null);

  // Sort shoes for trending tab - by view_count + favorite_count
  const displayShoes = useMemo(() => {
    if (activeTab === 'trending') {
      return [...shoes].sort((a, b) => {
        const scoreA = (a.view_count || 0) + (a.favorite_count || 0) * 2;
        const scoreB = (b.view_count || 0) + (b.favorite_count || 0) * 2;
        return scoreB - scoreA;
      });
    }
    return shoes;
  }, [shoes, activeTab]);

  const loadShoes = useCallback(async (pageToLoad: number) => {
    const data = await getInfiniteFeed(pageToLoad, 10);
    if (data.length > 0) {
      setShoes(prev => {
        // Avoid duplicates by checking IDs
        const existingIds = new Set(prev.map(s => s.id));
        const newShoes = data.filter(s => !existingIds.has(s.id));
        return [...prev, ...newShoes];
      });
      setPage(pageToLoad + 1);
    }
  }, [getInfiniteFeed]);

  const handleOpenShoePanel = useCallback(() => {
    // eslint-disable-next-line no-console
    if (import.meta.env.DEV) console.log('[FeedPage] handleOpenShoePanel called, shoes:', shoes.length, 'currentIndex:', currentIndex);
    if (shoes[currentIndex]) {
      trackPanelOpen('shoe', shoes[currentIndex].id);
      openShoePanel(shoes[currentIndex].id);
    } else {
      // Still open panel if we have any shoes
      if (shoes.length > 0) {
        trackPanelOpen('shoe', shoes[0].id);
        openShoePanel(shoes[0].id);
      } else {
        if (import.meta.env.DEV) console.warn('[FeedPage] Cannot open ShoePanel - no shoes loaded yet');
      }
    }
  }, [shoes, currentIndex, trackPanelOpen, openShoePanel]);

  const handleOpenMusicPanel = useCallback(() => {
    // eslint-disable-next-line no-console
    if (import.meta.env.DEV) console.log('[FeedPage] handleOpenMusicPanel called, shoes:', shoes.length, 'currentIndex:', currentIndex);
    if (shoes[currentIndex]) {
      trackPanelOpen('music', shoes[currentIndex].id);
    }
    // Open music panel regardless - it can show without a specific shoe
    openMusicPanel();
  }, [shoes, currentIndex, trackPanelOpen, openMusicPanel]);

  // Initial load - only once
  useEffect(() => {
    loadShoes(0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Auto-open music panel when first shoe with music loads
  useEffect(() => {
    if (!hasAutoOpenedMusic && shoes.length > 0 && shoes[0]?.music) {
      // Small delay to let the UI render first
      const timer = setTimeout(() => {
        openMusicPanel();
        setHasAutoOpenedMusic(true);
      }, 500);
      return () => clearTimeout(timer);
    }
  }, [shoes, hasAutoOpenedMusic, openMusicPanel]);

  useEffect(() => {
    if (shoes[currentIndex]) {
      trackView(shoes[currentIndex].id);
    }
  }, [currentIndex, shoes, trackView]);

  // Load more when near end
  useEffect(() => {
    if (currentIndex >= shoes.length - 3 && !loading && shoes.length > 0) {
      loadShoes(page);
    }
  }, [currentIndex, shoes.length, loading, page, loadShoes]);

  // Keyboard navigation
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      // Debug log
      if (import.meta.env.DEV) {
        // eslint-disable-next-line no-console
        console.log('[FeedPage] Key pressed:', e.key, 'shoes loaded:', shoes.length);
      }

      // Handle panel opening/closing regardless of container
      if (e.key === 'ArrowLeft') {
        e.preventDefault();
        // eslint-disable-next-line no-console
        if (import.meta.env.DEV) console.log('[FeedPage] Opening ShoePanel');
        handleOpenShoePanel();
        return;
      } else if (e.key === 'ArrowRight') {
        e.preventDefault();
        // eslint-disable-next-line no-console
        if (import.meta.env.DEV) console.log('[FeedPage] Opening MusicPanel');
        handleOpenMusicPanel();
        return;
      } else if (e.key === 'Escape') {
        closeShoePanel();
        closeMusicPanel();
        closeNotificationsPanel();
        return;
      }

      // For up/down navigation, we need the container and shoes
      const container = containerRef.current;
      if (!container || displayShoes.length === 0) return;

      if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = Math.max(0, currentIndex - 1);
        setCurrentIndex(prevIndex);
        const card = container.querySelector(`[data-index="${prevIndex}"]`);
        card?.scrollIntoView({ behavior: 'smooth' });
      } else if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = Math.min(displayShoes.length - 1, currentIndex + 1);
        setCurrentIndex(nextIndex);
        const card = container.querySelector(`[data-index="${nextIndex}"]`);
        card?.scrollIntoView({ behavior: 'smooth' });
      }
    };

    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [currentIndex, displayShoes, shoes.length, handleOpenShoePanel, handleOpenMusicPanel, closeShoePanel, closeMusicPanel, closeNotificationsPanel]);

  // Touch swipe gestures for mobile
  useEffect(() => {
    const container = containerRef.current;
    if (!container) return;

    let touchStartX = 0;
    let touchStartY = 0;

    const handleTouchStart = (e: TouchEvent) => {
      touchStartX = e.touches[0].clientX;
      touchStartY = e.touches[0].clientY;
    };

    const handleTouchEnd = (e: TouchEvent) => {
      const touchEndX = e.changedTouches[0].clientX;
      const touchEndY = e.changedTouches[0].clientY;
      const diffX = touchEndX - touchStartX;
      const diffY = touchEndY - touchStartY;

      // Only trigger if horizontal swipe is greater than vertical (to not interfere with scroll)
      if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > 75) {
        if (diffX > 0) {
          // Swiped right - open ShoePanel
          handleOpenShoePanel();
        } else {
          // Swiped left - open MusicPanel
          handleOpenMusicPanel();
        }
      }
    };

    container.addEventListener('touchstart', handleTouchStart, { passive: true });
    container.addEventListener('touchend', handleTouchEnd, { passive: true });

    return () => {
      container.removeEventListener('touchstart', handleTouchStart);
      container.removeEventListener('touchend', handleTouchEnd);
    };
  }, [handleOpenShoePanel, handleOpenMusicPanel]);

  // Intersection Observer for tracking visible card
  useEffect(() => {
    const container = containerRef.current;
    if (!container) return;

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting && entry.intersectionRatio > 0.5) {
            const index = parseInt(entry.target.getAttribute('data-index') || '0');
            setCurrentIndex(index);
          }
        });
      },
      { root: container, threshold: 0.5 }
    );

    container.querySelectorAll('.feed-card').forEach((card) => observer.observe(card));

    return () => observer.disconnect();
  }, [shoes]);

  const handleBuyClick = (shoe: Shoe) => {
    trackClick(shoe.id);
    trackShoeClick(shoe.id);
    window.open(getAffiliateUrl(shoe.amazon_url), '_blank');
  };

  const handleShare = async (shoe: Shoe) => {
    // Generate smart share data with deep links and affiliate tracking
    const shareData = createAffiliateShareData(shoe, 'share_native');

    if (navigator.share) {
      try {
        await navigator.share({
          title: shareData.title,
          text: shareData.text,
          url: shareData.url,
        });
        trackShare(shoe.id, 'native');
      } catch {
        if (import.meta.env.DEV) console.warn('Share cancelled');
      }
    } else {
      // Copy rich share text to clipboard
      navigator.clipboard.writeText(shareData.text);
      trackShare(shoe.id, 'clipboard');
      // Show toast instead of alert
      setShowShareToast(true);
      setTimeout(() => setShowShareToast(false), 2500);
    }
  };

  const handleFavorite = async (shoe: Shoe) => {
    const wasAlreadyFavorite = isFavorite(shoe.id);
    const success = await toggleFavorite(shoe.id);
    if (success) {
      trackFavorite(shoe.id, wasAlreadyFavorite ? 'remove' : 'add');
    }
  };

  if (loading && shoes.length === 0) {
    return (
      <div className="h-screen bg-zinc-950 flex items-center justify-center">
        <div className="text-center">
          <div className="w-12 h-12 border-4 border-orange-500 border-t-transparent rounded-full animate-spin mx-auto mb-4" />
          <p className="text-zinc-400">Loading sneakers...</p>
        </div>
      </div>
    );
  }

  if (shoes.length === 0) {
    return (
      <div className="h-screen bg-zinc-950 flex items-center justify-center">
        <div className="text-center">
          <p className="text-2xl mb-2">👟</p>
          <p className="text-zinc-400">No sneakers found</p>
        </div>
      </div>
    );
  }

  return (
    <div
      ref={containerRef}
      className="h-screen overflow-y-scroll snap-y snap-mandatory scrollbar-hide relative"
      style={{
        scrollSnapType: 'y mandatory',
        WebkitOverflowScrolling: 'touch',
        scrollbarWidth: 'none',
        msOverflowStyle: 'none'
      }}
      role="feed"
      aria-label="Sneaker feed"
    >
      {/* Notification Bell - Fixed Position */}
      <button
        onClick={openNotificationsPanel}
        aria-label={`Notifications${unreadCount > 0 ? `, ${unreadCount} unread` : ''}`}
        className="fixed top-4 right-4 z-30 w-11 h-11 bg-black/40 backdrop-blur-sm rounded-full flex items-center justify-center active:scale-90 transition-transform"
      >
        <FaBell className="text-white text-lg" aria-hidden="true" />
        {unreadCount > 0 && (
          <span className="absolute -top-1 -right-1 min-w-[18px] h-[18px] bg-red-500 text-white text-[10px] font-bold rounded-full flex items-center justify-center px-1" aria-hidden="true">
            {unreadCount > 9 ? '9+' : unreadCount}
          </span>
        )}
      </button>

      {/* Tab Toggle - For You / Trending */}
      <div className="fixed top-4 left-1/2 -translate-x-1/2 z-30 flex bg-black/40 backdrop-blur-sm rounded-full p-1">
        <button
          onClick={() => setActiveTab('foryou')}
          className={`px-4 py-2 rounded-full text-sm font-semibold transition-all ${activeTab === 'foryou' ? 'bg-white text-black' : 'text-white hover:bg-white/10'}`}
        >
          For You
        </button>
        <button
          onClick={() => setActiveTab('trending')}
          className={`px-4 py-2 rounded-full text-sm font-semibold transition-all flex items-center gap-1.5 ${activeTab === 'trending' ? 'bg-orange-500 text-white' : 'text-white hover:bg-white/10'}`}
        >
          <FaFire className={activeTab === 'trending' ? 'text-white' : 'text-orange-400'} />
          Trending
        </button>
      </div>

      {displayShoes.map((shoe, index) => (
        <article
          key={`${shoe.id}-${index}`}
          data-index={index}
          className="feed-card h-screen min-h-screen snap-start snap-always flex flex-col bg-zinc-950"
          style={{ scrollSnapAlign: 'start', scrollSnapStop: 'always' }}
          aria-label={`${shoe.brand} ${shoe.name}`}
          aria-setsize={shoes.length}
          aria-posinset={index + 1}
        >
          {/* TOP: Shoe Image Area - Takes remaining space, no UI on top */}
          <div className="flex-1 flex items-center justify-center bg-zinc-900 pt-16 pb-4 px-4 min-h-0">
            <img
              src={shoe.image_url}
              alt={`${shoe.brand} ${shoe.name}${shoe.colorway ? ` in ${shoe.colorway}` : ''}`}
              className="max-w-full max-h-full object-contain"
              loading={index < 2 ? "eager" : "lazy"}
              decoding={index < 2 ? "sync" : "async"}
            />
          </div>

          {/* BOTTOM: UI Area - Fixed height, no overlap with image */}
          <div className="flex-shrink-0 bg-zinc-950 px-4 pt-4 pb-20">
            {/* Info Row with Action Buttons */}
            <div className="flex gap-4 mb-4">
              {/* Left: Info */}
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-1">
                  <span className="bg-orange-500 text-white text-xs font-bold px-2.5 py-1 rounded-full uppercase">
                    {shoe.brand}
                  </span>
                  {shoe.is_featured && (
                    <span className="bg-red-500 text-white text-xs font-bold px-2 py-1 rounded-full flex items-center gap-1">
                      <FaFire className="text-[10px]" /> HOT
                    </span>
                  )}
                </div>
                <h1 className="text-xl font-black text-white leading-tight mb-1 truncate">{shoe.name}</h1>
                <div className="flex flex-wrap gap-2">
                  {shoe.style_tags?.slice(0, 3).map((tag) => (
                    <span key={tag} className="text-zinc-400 text-xs">#{tag}</span>
                  ))}
                </div>
                {shouldShowPrice(shoe.price) && (
                  <span className="text-lg font-bold text-orange-400 mt-1 block">{formatPrice(shoe.price)}</span>
                )}
              </div>

              {/* Right: Action Buttons */}
              <div className="flex gap-3" role="group" aria-label="Actions">
                <button
                  onClick={() => handleFavorite(shoe)}
                  aria-label={isFavorite(shoe.id) ? `Unlike` : `Like`}
                  className="flex flex-col items-center"
                >
                  <div className={`w-11 h-11 rounded-full flex items-center justify-center transition-all ${isFavorite(shoe.id) ? 'bg-red-500' : 'bg-zinc-800'}`}>
                    <FaHeart className="text-lg text-white" />
                  </div>
                  <span className="text-[10px] text-zinc-400 mt-1">{shoe.favorite_count || 0}</span>
                </button>

                <button
                  onClick={() => { trackPanelOpen('shoe', shoe.id); openShoePanel(shoe.id); }}
                  aria-label="View Details"
                  className="flex flex-col items-center"
                >
                  <div className="w-11 h-11 bg-zinc-800 rounded-full flex items-center justify-center">
                    <FaBookmark className="text-lg text-white" />
                  </div>
                  <span className="text-[10px] text-zinc-400 mt-1">Save</span>
                </button>

                <button
                  onClick={() => handleShare(shoe)}
                  aria-label="Share"
                  className="flex flex-col items-center"
                >
                  <div className="w-11 h-11 bg-zinc-800 rounded-full flex items-center justify-center">
                    <FaShare className="text-lg text-white" />
                  </div>
                  <span className="text-[10px] text-zinc-400 mt-1">Share</span>
                </button>
              </div>
            </div>

            {/* Buy Button */}
            <button
              onClick={() => handleBuyClick(shoe)}
              aria-label={`Buy on Amazon`}
              className="w-full bg-white text-black font-black py-3.5 rounded-xl flex items-center justify-center gap-3 text-base active:scale-[0.98] transition-transform"
            >
              <FaAmazon className="text-xl" />
              BUY ON AMAZON
            </button>

            {/* Music Bar */}
            {shoe.music && (
              <button
                onClick={handleOpenMusicPanel}
                aria-label={`${shoe.music.song} by ${shoe.music.artist}`}
                className="w-full flex items-center gap-3 mt-3 bg-zinc-900 rounded-full px-3 py-2"
              >
                <div className="w-8 h-8 rounded-full bg-gradient-to-br from-zinc-600 to-zinc-800 flex items-center justify-center animate-spin-slow border border-zinc-600 flex-shrink-0">
                  <div className="w-3 h-3 rounded-full bg-orange-500 flex items-center justify-center">
                    <div className="w-1 h-1 rounded-full bg-black" />
                  </div>
                </div>
                <FaMusic className="text-orange-400 text-sm flex-shrink-0" />
                <span className="text-zinc-300 text-sm truncate">{shoe.music.song} • {shoe.music.artist}</span>
              </button>
            )}
          </div>
        </article>
      ))}

      {/* Shoe Panel - Opens on Left Arrow */}
      {(displayShoes[currentIndex] || displayShoes[0]) && (
        <ShoePanel
          shoe={displayShoes[currentIndex] || displayShoes[0]}
          isOpen={isShoePanelOpen}
          onClose={closeShoePanel}
        />
      )}

      {/* Music Panel - Opens on Right Arrow */}
      {(displayShoes[currentIndex] || displayShoes[0]) && (
        <MusicPanel
          shoe={displayShoes[currentIndex] || displayShoes[0]}
          isOpen={isMusicPanelOpen}
          onClose={closeMusicPanel}
        />
      )}

      {/* Notifications Panel */}
      <NotificationsPanel
        isOpen={isNotificationsPanelOpen}
        onClose={closeNotificationsPanel}
      />

      {/* Share Success Toast */}
      <div
        role="status"
        aria-live="polite"
        className={`fixed bottom-24 left-1/2 -translate-x-1/2 bg-zinc-800 text-white px-4 py-3 rounded-xl flex items-center gap-2 shadow-lg z-50 transition-all duration-300 ${showShareToast ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-4 pointer-events-none'
          }`}
      >
        <div className="w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">
          <FaCheck className="text-xs text-white" aria-hidden="true" />
        </div>
        <span className="font-medium">Link copied with affiliate tracking!</span>
      </div>

      {/* Exit Intent Popup */}
      <ExitIntentPopup showDelay={5000} />
    </div>
  );
};

export default FeedPage;
