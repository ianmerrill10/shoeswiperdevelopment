import React, { useEffect, useRef, useState, useCallback } from 'react';
import { FaBell, FaCheck } from 'react-icons/fa';
import { useSneakers } from '../hooks/useSneakers';
import { useAnalytics } from '../hooks/useAnalytics';
import { useFavorites } from '../hooks/useFavorites';
import { usePriceAlerts } from '../hooks/usePriceAlerts';
import { useUIStore } from '../store';
import { getAffiliateUrl, trackAffiliateClick, extractAsinFromUrl } from '../lib/supabaseClient';
import { createAffiliateShareData } from '../lib/deepLinks';
import { Shoe } from '../lib/types';
import ShoePanel from '../components/ShoePanel';
import MusicPanel from '../components/MusicPanel';
import NotificationsPanel from '../components/NotificationsPanel';
import SwipeableCard from '../components/SwipeableCard';

const SwipeFeedPage: React.FC = () => {
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
  const containerRef = useRef<HTMLDivElement>(null);
  const currentIndexRef = useRef(0);
  const shoesLengthRef = useRef(0);
  const prefetchedUrlsRef = useRef<Set<string>>(new Set());
  const rafIdRef = useRef<number | null>(null);

  const loadShoes = useCallback(async (pageToLoad: number) => {
    const data = await getInfiniteFeed(pageToLoad, 10);
    if (data.length > 0) {
      setShoes(prev => {
        const existingIds = new Set(prev.map(s => s.id));
        const newShoes = data.filter(s => !existingIds.has(s.id));
        return [...prev, ...newShoes];
      });
      setPage(pageToLoad + 1);
    }
  }, [getInfiniteFeed]);

  const scrollToIndex = useCallback((index: number) => {
    const container = containerRef.current;
    if (!container) return;
    const top = index * container.clientHeight;
    container.scrollTo({ top, behavior: 'smooth' });
  }, []);

  const handleOpenShoePanel = useCallback((shoe: Shoe) => {
    trackPanelOpen('shoe', shoe.id);
    openShoePanel(shoe.id);
  }, [trackPanelOpen, openShoePanel]);

  const handleOpenMusicPanel = useCallback((shoe: Shoe) => {
    trackPanelOpen('music', shoe.id);
    openMusicPanel();
  }, [trackPanelOpen, openMusicPanel]);

  useEffect(() => {
    currentIndexRef.current = currentIndex;
  }, [currentIndex]);

  useEffect(() => {
    shoesLengthRef.current = shoes.length;
  }, [shoes.length]);

  useEffect(() => {
    loadShoes(0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (shoes[currentIndex]) trackView(shoes[currentIndex].id);
  }, [currentIndex, shoes, trackView]);

  // Prefetch next images for smoother scroll
  useEffect(() => {
    const next = [currentIndex + 1, currentIndex + 2]
      .map(i => shoes[i])
      .filter((s): s is Shoe => Boolean(s));

    next.forEach((shoe) => {
      if (!shoe.image_url) return;
      if (prefetchedUrlsRef.current.has(shoe.image_url)) return;
      prefetchedUrlsRef.current.add(shoe.image_url);
      const img = new Image();
      img.decoding = 'async';
      img.src = shoe.image_url;
    });
  }, [currentIndex, shoes]);

  // Load more when near end
  useEffect(() => {
    if (currentIndex >= shoes.length - 3 && !loading && shoes.length > 0) {
      loadShoes(page);
    }
  }, [currentIndex, shoes.length, loading, loadShoes, page]);

  // Track current index via rAF-throttled scroll (lighter than observing N slides)
  useEffect(() => {
    const container = containerRef.current;
    if (!container) return;

    const updateIndexFromScroll = () => {
      rafIdRef.current = null;

      const height = container.clientHeight;
      if (height <= 0) return;

      const idx = Math.round(container.scrollTop / height);
      const clamped = Math.max(0, Math.min(shoesLengthRef.current - 1, idx));
      if (clamped !== currentIndexRef.current) setCurrentIndex(clamped);
    };

    const onScroll = () => {
      if (rafIdRef.current != null) return;
      rafIdRef.current = window.requestAnimationFrame(updateIndexFromScroll);
    };

    container.addEventListener('scroll', onScroll, { passive: true });
    // Initialize on mount / list changes
    onScroll();

    return () => {
      container.removeEventListener('scroll', onScroll);
      if (rafIdRef.current != null) {
        window.cancelAnimationFrame(rafIdRef.current);
        rafIdRef.current = null;
      }
    };
  }, [shoes.length]);

  // Keyboard navigation
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (shoes.length === 0) return;

      if (e.key === 'ArrowUp') {
        e.preventDefault();
        const next = Math.max(0, currentIndexRef.current - 1);
        scrollToIndex(next);
      } else if (e.key === 'ArrowDown') {
        e.preventDefault();
        const next = Math.min(shoesLengthRef.current - 1, currentIndexRef.current + 1);
        scrollToIndex(next);
      } else if (e.key === 'ArrowLeft') {
        e.preventDefault();
        const shoe = shoes[currentIndexRef.current];
        if (shoe) handleOpenShoePanel(shoe);
      } else if (e.key === 'ArrowRight') {
        e.preventDefault();
        const shoe = shoes[currentIndexRef.current];
        if (shoe) handleOpenMusicPanel(shoe);
      } else if (e.key === 'Escape') {
        closeShoePanel();
        closeMusicPanel();
        closeNotificationsPanel();
      }
    };

    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [shoes, handleOpenShoePanel, handleOpenMusicPanel, closeShoePanel, closeMusicPanel, closeNotificationsPanel, scrollToIndex]);

  const handleBuyClick = (shoe: Shoe) => {
    trackClick(shoe.id);
    trackShoeClick(shoe.id);
    
    // Track affiliate click for revenue attribution
    const asin = extractAsinFromUrl(shoe.amazon_url);
    trackAffiliateClick(shoe.id, asin || undefined, 'swipe_feed');
    
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

  const handleSwipeRight = useCallback(async (shoe: Shoe) => {
    const wasAlreadyFavorite = isFavorite(shoe.id);
    const success = await toggleFavorite(shoe.id);
    if (success) trackFavorite(shoe.id, wasAlreadyFavorite ? 'remove' : 'add');
  }, [isFavorite, toggleFavorite, trackFavorite]);

  const handleSwipeLeft = useCallback((_shoe: Shoe) => {
    // Skip to next item (TikTok-style feed still advances vertically)
    const idx = Math.min(shoesLengthRef.current - 1, currentIndexRef.current + 1);
    scrollToIndex(idx);
  }, [scrollToIndex]);

  const currentShoe = shoes[currentIndex];

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
      className="h-[100svh] bg-zinc-950 relative overflow-y-scroll snap-y snap-mandatory overscroll-y-contain no-scrollbar touch-pan-y"
    >
      {/* Notification Bell - Fixed Position */}
      <button
        onClick={openNotificationsPanel}
        className="fixed top-4 right-4 z-30 w-11 h-11 bg-black/40 backdrop-blur-sm rounded-full flex items-center justify-center active:scale-90 transition-transform"
      >
        <FaBell className="text-white text-lg" />
        {unreadCount > 0 && (
          <span className="absolute -top-1 -right-1 min-w-[18px] h-[18px] bg-red-500 text-white text-[10px] font-bold rounded-full flex items-center justify-center px-1">
            {unreadCount > 9 ? '9+' : unreadCount}
          </span>
        )}
      </button>

      {/* Swipe Counter */}
      <div className="fixed top-4 left-4 z-30 bg-black/40 backdrop-blur-sm rounded-full px-3 py-1.5">
        <span className="text-white text-sm font-bold">
          {currentIndex + 1} / {shoes.length}
        </span>
      </div>

      {/* Vertical Snap Feed */}
      <div className="relative">
        {shoes.map((shoe, idx) => {
          const favorite = isFavorite(shoe.id);
          const isActive = idx === currentIndex;
          const isNext = idx === currentIndex + 1;
          const imageLoading = isActive || isNext ? 'eager' : 'lazy';
          const imageFetchPriority = isActive ? 'high' : 'auto';

          return (
          <div
            key={shoe.id}
            data-swipe-index={idx}
            className="h-[100svh] snap-start snap-always relative"
          >
            <SwipeableCard
              shoe={shoe}
              enableDrag={false}
              onSwipeRight={handleSwipeRight}
              onSwipeLeft={handleSwipeLeft}
              onCardClick={handleOpenShoePanel}
              onBuyClick={handleBuyClick}
              onShareClick={handleShare}
              onMusicClick={handleOpenMusicPanel}
              isFavorite={favorite}
              isInCloset={favorite}
              showMusicBar={!!shoe.music}
              imageLoading={imageLoading}
              imageFetchPriority={imageFetchPriority}
            />
          </div>
          );
        })}
      </div>

      {/* Shoe Panel - Opens on Left Arrow */}
      {currentShoe && (
        <ShoePanel
          shoe={currentShoe}
          isOpen={isShoePanelOpen}
          onClose={closeShoePanel}
        />
      )}

      {/* Music Panel - Opens on Right Arrow */}
      {currentShoe && (
        <MusicPanel
          shoe={currentShoe}
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
        className={`fixed bottom-24 left-1/2 -translate-x-1/2 bg-zinc-800 text-white px-4 py-3 rounded-xl flex items-center gap-2 shadow-lg z-50 transition-all duration-300 ${
          showShareToast ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-4 pointer-events-none'
        }`}
      >
        <div className="w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">
          <FaCheck className="text-xs text-white" />
        </div>
        <span className="font-medium">Link copied with affiliate tracking!</span>
      </div>
    </div>
  );
};

export default SwipeFeedPage;
