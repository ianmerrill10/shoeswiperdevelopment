import React, { useCallback, useState } from 'react';
import { motion, useMotionValue, useTransform, PanInfo } from 'framer-motion';
import { FaHeart, FaTimes, FaAmazon, FaBookmark, FaShare, FaMusic } from 'react-icons/fa';
import { Shoe } from '../lib/types';
import { useReducedMotion, useHaptics, SwipeDirection } from '../hooks/useAnimations';
import { SPRING_CONFIGS, DEFAULT_SWIPE_CONFIG } from '../lib/animationConfig';
import { shouldShowPrice, formatPrice } from '../lib/supabaseClient';
import MatchCelebration from './MatchCelebration';

interface SwipeableCardProps {
  shoe: Shoe;
  onSwipeLeft?: (shoe: Shoe) => void;
  onSwipeRight?: (shoe: Shoe) => void;
  onCardClick?: (shoe: Shoe) => void;
  onBuyClick?: (shoe: Shoe) => void;
  onShareClick?: (shoe: Shoe) => void;
  onMusicClick?: (shoe: Shoe) => void;
  isFavorite?: boolean;
  isInCloset?: boolean;
  showMusicBar?: boolean;
  enableDrag?: boolean;
  imageLoading?: 'eager' | 'lazy';
  imageFetchPriority?: 'high' | 'low' | 'auto';
  isActive?: boolean; // When true, shows inline music player for autoplay
  soundEnabled?: boolean; // When true, shows Spotify embed for autoplay
}

const SwipeableCard: React.FC<SwipeableCardProps> = ({
  shoe,
  onSwipeLeft,
  onSwipeRight,
  onCardClick,
  onBuyClick,
  onShareClick,
  onMusicClick,
  isFavorite = false,
  isInCloset = false,
  showMusicBar = true,
  enableDrag = true,
  imageLoading = 'lazy',
  imageFetchPriority = 'auto',
  isActive = false,
  soundEnabled = false,
}) => {
  const { prefersReducedMotion } = useReducedMotion();
  const { trigger: triggerHaptic } = useHaptics();
  
  // Motion values for drag
  const x = useMotionValue(0);
  const y = useMotionValue(0);
  
  // State for celebration
  const [showCelebration, setShowCelebration] = useState(false);
  const [isDragging, setIsDragging] = useState(false);

  // Transform rotation based on x position
  const rotate = useTransform(
    x,
    [-300, 0, 300],
    prefersReducedMotion ? [0, 0, 0] : [-DEFAULT_SWIPE_CONFIG.maxRotation, 0, DEFAULT_SWIPE_CONFIG.maxRotation]
  );

  // Transform opacity for like/dislike indicators
  const likeOpacity = useTransform(x, [0, DEFAULT_SWIPE_CONFIG.swipeThreshold], [0, 1]);
  const dislikeOpacity = useTransform(x, [-DEFAULT_SWIPE_CONFIG.swipeThreshold, 0], [1, 0]);

  // Transform shadow based on drag state
  const boxShadow = useTransform(
    x,
    [-200, -100, 0, 100, 200],
    [
      '0 10px 40px rgba(239, 68, 68, 0.3)', // Red shadow for dislike
      '0 10px 40px rgba(239, 68, 68, 0.15)',
      '0 4px 20px rgba(0, 0, 0, 0.3)', // Default shadow
      '0 10px 40px rgba(34, 197, 94, 0.15)',
      '0 10px 40px rgba(34, 197, 94, 0.3)', // Green shadow for like
    ]
  );

  // Scale transform for elevation effect during drag
  const scale = useTransform(
    x,
    [-200, 0, 200],
    prefersReducedMotion ? [1, 1, 1] : [1.02, 1, 1.02]
  );

  const handleDragStart = useCallback(() => {
    setIsDragging(true);
    triggerHaptic('light');
  }, [triggerHaptic]);

  const handleDrag = useCallback((_: MouseEvent | TouchEvent | PointerEvent, info: PanInfo) => {
    const absX = Math.abs(info.offset.x);
    if (absX > DEFAULT_SWIPE_CONFIG.swipeThreshold * 0.8) {
      triggerHaptic('medium');
    }
  }, [triggerHaptic]);

  const handleDragEnd = useCallback(
    (_: MouseEvent | TouchEvent | PointerEvent, info: PanInfo) => {
      setIsDragging(false);
      
      const absX = Math.abs(info.offset.x);
      const absVelocity = Math.abs(info.velocity.x);
      
      // Check if swipe threshold is met by either distance or velocity
      const isSwipe = absX > DEFAULT_SWIPE_CONFIG.swipeThreshold || 
                      absVelocity > DEFAULT_SWIPE_CONFIG.velocityThreshold;
      
      if (isSwipe) {
        const direction: SwipeDirection = info.offset.x > 0 ? 'right' : 'left';
        
        if (direction === 'right') {
          triggerHaptic('success');
          setShowCelebration(true);
          setTimeout(() => {
            onSwipeRight?.(shoe);
          }, 300);
        } else {
          triggerHaptic('swipe');
          onSwipeLeft?.(shoe);
        }
      } else {
        triggerHaptic('light');
      }
    },
    [shoe, onSwipeLeft, onSwipeRight, triggerHaptic]
  );

  const handleCelebrationComplete = useCallback(() => {
    setShowCelebration(false);
  }, []);

  const handleBuyClick = (e: React.MouseEvent) => {
    e.stopPropagation();
    triggerHaptic('medium');
    onBuyClick?.(shoe);
  };

  const handleShareClick = (e: React.MouseEvent) => {
    e.stopPropagation();
    triggerHaptic('light');
    onShareClick?.(shoe);
  };

  const handleMusicClick = (e: React.MouseEvent) => {
    e.stopPropagation();
    onMusicClick?.(shoe);
  };

  const dragProps = enableDrag
    ? {
        drag: 'x' as const,
        dragConstraints: { left: 0, right: 0, top: 0, bottom: 0 },
        dragElastic: 0.9,
        onDragStart: handleDragStart,
        onDrag: handleDrag,
        onDragEnd: handleDragEnd,
      }
    : {};

  return (
    <motion.div
      className={
        enableDrag
          ? 'relative w-full h-full touch-none select-none overflow-hidden flex flex-col bg-zinc-950'
          : 'relative w-full h-full touch-pan-y select-none overflow-hidden flex flex-col bg-zinc-950'
      }
      style={{ x, y, rotate, scale, boxShadow }}
      {...dragProps}
      whileTap={prefersReducedMotion ? {} : { scale: 0.98 }}
      transition={prefersReducedMotion ? { duration: 0 } : {
        type: 'spring',
        ...SPRING_CONFIGS.returnToCenter,
      }}
      onClick={() => !isDragging && onCardClick?.(shoe)}
      role="article"
      aria-label={`${shoe.brand} ${shoe.name}. Swipe right to like, left to skip.`}
    >
      {/* Image Container - fills available space, shoe fully visible */}
      <div className="relative flex-1 min-h-0 flex items-center justify-center bg-zinc-900">
        <img
          src={shoe.image_url}
          alt={`${shoe.brand} ${shoe.name}${shoe.colorway ? ` in ${shoe.colorway}` : ''}`}
          className="max-w-full max-h-full w-auto h-auto object-contain pointer-events-none"
          draggable={false}
          loading={imageLoading}
          decoding="async"
          fetchPriority={imageFetchPriority}
        />

        {/* Like/Dislike Indicators (only when dragging is enabled) */}
        {enableDrag && (
          <>
            <motion.div
              className="absolute top-1/4 left-8 z-20 pointer-events-none"
              style={{ opacity: likeOpacity }}
            >
              <div className="bg-green-500 rounded-lg px-6 py-3 border-4 border-green-400 rotate-[-15deg]">
                <span className="text-white font-black text-2xl tracking-wider">LIKE</span>
              </div>
            </motion.div>

            <motion.div
              className="absolute top-1/4 right-8 z-20 pointer-events-none"
              style={{ opacity: dislikeOpacity }}
            >
              <div className="bg-red-500 rounded-lg px-6 py-3 border-4 border-red-400 rotate-[15deg]">
                <span className="text-white font-black text-2xl tracking-wider">NOPE</span>
              </div>
            </motion.div>
          </>
        )}

        {/* Side Actions - positioned inside image area */}
        <div className="absolute right-3 top-1/2 -translate-y-1/2 flex flex-col gap-4 z-10" role="group" aria-label="Sneaker actions">
        <motion.button
          onClick={(e) => {
            e.stopPropagation();
            triggerHaptic('medium');
            onSwipeRight?.(shoe);
            setShowCelebration(true);
          }}
          aria-label={isFavorite ? `Remove ${shoe.name} from favorites` : `Add ${shoe.name} to favorites`}
          aria-pressed={isFavorite}
          className="flex flex-col items-center gap-1"
          whileTap={prefersReducedMotion ? {} : { scale: 0.9 }}
        >
          <div className={`w-11 h-11 backdrop-blur-sm rounded-full flex items-center justify-center transition-all ${
            isFavorite ? 'bg-red-500' : 'bg-black/30'
          }`}>
            <FaHeart className="text-xl text-white" aria-hidden="true" />
          </div>
          <span className="text-xs font-bold text-white drop-shadow" aria-hidden="true">
            {isFavorite ? 'Liked' : shoe.favorite_count}
          </span>
        </motion.button>

        <motion.button
          onClick={(e) => {
            e.stopPropagation();
            triggerHaptic('light');
          }}
          aria-label={isInCloset ? `${shoe.name} is saved to closet` : `Save ${shoe.name} to closet`}
          aria-pressed={isInCloset}
          className="flex flex-col items-center gap-1"
          whileTap={prefersReducedMotion ? {} : { scale: 0.9 }}
        >
          <div className={`w-11 h-11 backdrop-blur-sm rounded-full flex items-center justify-center transition-all ${
            isInCloset ? 'bg-orange-500' : 'bg-black/30'
          }`}>
            <FaBookmark className="text-xl text-white" aria-hidden="true" />
          </div>
          <span className="text-xs font-bold text-white drop-shadow" aria-hidden="true">
            {isInCloset ? 'Saved' : 'Save'}
          </span>
        </motion.button>

        <motion.button
          onClick={handleShareClick}
          aria-label={`Share ${shoe.name}`}
          className="flex flex-col items-center gap-1"
          whileTap={prefersReducedMotion ? {} : { scale: 0.9 }}
        >
          <div className="w-11 h-11 bg-black/30 backdrop-blur-sm rounded-full flex items-center justify-center">
            <FaShare className="text-xl text-white" aria-hidden="true" />
          </div>
          <span className="text-xs font-bold text-white drop-shadow" aria-hidden="true">Share</span>
        </motion.button>

        <motion.button
          onClick={(e) => {
            e.stopPropagation();
            triggerHaptic('swipe');
            onSwipeLeft?.(shoe);
          }}
          aria-label={`Skip ${shoe.name}`}
          className="flex flex-col items-center gap-1"
          whileTap={prefersReducedMotion ? {} : { scale: 0.9 }}
        >
          <div className="w-11 h-11 bg-black/30 backdrop-blur-sm rounded-full flex items-center justify-center">
            <FaTimes className="text-xl text-white" aria-hidden="true" />
          </div>
          <span className="text-xs font-bold text-white drop-shadow" aria-hidden="true">Skip</span>
        </motion.button>
        </div>
      </div>

      {/* Content Section - below image, not overlaying */}
      <div className="flex-shrink-0 bg-zinc-950 px-4 pt-3 pb-2 safe-bottom">
        {/* Brand & Tags */}
        <div className="flex items-center gap-2 mb-2">
          <span className="bg-orange-500 text-white text-xs font-bold px-3 py-1 rounded-full uppercase">
            {shoe.brand}
          </span>
          {shoe.is_featured && (
            <span className="bg-red-500 text-white text-xs font-bold px-2 py-1 rounded-full">
              🔥 HOT
            </span>
          )}
        </div>

        {/* Name */}
        <h1 className="text-xl font-black text-white leading-tight mb-1">
          {shoe.name}
        </h1>

        {/* Style Tags */}
        <div className="flex flex-wrap gap-2 mb-3">
          {shoe.style_tags?.slice(0, 3).map((tag) => (
            <span
              key={tag}
              className="bg-zinc-800 text-zinc-300 text-xs px-2 py-1 rounded"
            >
              #{tag}
            </span>
          ))}
        </div>

        {/* Price - Only shown when Amazon API is connected */}
        {shouldShowPrice(shoe.price) && (
          <div className="flex items-center gap-3 mb-3">
            <span className="text-2xl font-bold text-orange-400">
              {formatPrice(shoe.price)}
            </span>
          </div>
        )}

        {/* Buy Button */}
        <motion.button
          onClick={handleBuyClick}
          aria-label={`Buy ${shoe.name} on Amazon`}
          className="w-full bg-white text-black font-black py-3 rounded-xl flex items-center justify-center gap-3 text-base shadow-lg"
          whileTap={prefersReducedMotion ? {} : { scale: 0.95 }}
          transition={{ duration: 0.1 }}
        >
          <FaAmazon className="text-2xl" aria-hidden="true" />
          BUY ON AMAZON
        </motion.button>
      </div>

      {/* Music Bar - positioned at bottom of image area */}
      {showMusicBar && shoe.music && (() => {
        // Extract Spotify track ID for inline embed
        const spotifyMatch = shoe.music?.spotifyUrl?.match(/track\/([a-zA-Z0-9]+)/);
        const spotifyTrackId = spotifyMatch ? spotifyMatch[1] : null;
        
        // Show inline Spotify player only when: active + soundEnabled + has Spotify URL
        const showInlinePlayer = isActive && soundEnabled && spotifyTrackId;
        
        return (
          <>
            {/* Inline Spotify Embed - only loads when card is active AND sound is enabled */}
            {showInlinePlayer && (
              <div className="absolute bottom-[180px] left-4 right-4 z-20">
                <iframe
                  src={`https://open.spotify.com/embed/track/${spotifyTrackId}?utm_source=generator&theme=0`}
                  width="100%"
                  height="80"
                  frameBorder="0"
                  allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
                  loading="eager"
                  className="rounded-xl shadow-lg shadow-orange-500/30"
                  title={`${shoe.music.song} by ${shoe.music.artist}`}
                />
              </div>
            )}
            
            {/* Music bar when player not showing */}
            {!showInlinePlayer && (
              <motion.button
                onClick={handleMusicClick}
                aria-label={`Now playing: ${shoe.music.song} by ${shoe.music.artist}. Tap for music links.`}
                className="absolute bottom-[180px] left-4 right-4 flex items-center gap-3 bg-black/60 backdrop-blur-sm rounded-full px-3 py-2 z-10"
                whileTap={prefersReducedMotion ? {} : { scale: 0.98 }}
              >
                {/* Spinning Disc */}
                <div className="w-10 h-10 rounded-full bg-gradient-to-br from-zinc-700 to-zinc-900 flex items-center justify-center animate-spin-slow flex-shrink-0 border border-zinc-600" aria-hidden="true">
                  <div className="w-4 h-4 rounded-full bg-orange-500 flex items-center justify-center">
                    <div className="w-1.5 h-1.5 rounded-full bg-black" />
                  </div>
                </div>

                {/* Song Info with Marquee */}
                <div className="flex-1 overflow-hidden">
                  <div className="flex items-center gap-2">
                    <FaMusic className="text-orange-500 text-xs flex-shrink-0" aria-hidden="true" />
                    <div className="overflow-hidden whitespace-nowrap">
                      <span className="inline-block animate-marquee text-white text-sm font-medium">
                        {shoe.music.song} • {shoe.music.artist}
                      </span>
                    </div>
                  </div>
                </div>

                {/* Tap hint */}
                <span className="text-zinc-400 text-xs flex-shrink-0" aria-hidden="true">{soundEnabled ? 'No preview' : 'Tap 🔊 for music'}</span>
              </motion.button>
            )}
          </>
        );
      })()}

      {/* Match Celebration Overlay */}
      <MatchCelebration
        isVisible={showCelebration}
        onComplete={handleCelebrationComplete}
        shoeName={shoe.name}
      />
    </motion.div>
  );
};

export default React.memo(SwipeableCard);
