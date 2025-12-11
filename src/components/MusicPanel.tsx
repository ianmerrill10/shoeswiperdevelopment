import React, { useState } from 'react';
import { FaTimes, FaSpotify, FaApple, FaAmazon, FaPlay, FaHeart, FaMusic } from 'react-icons/fa';
import { Shoe } from '../lib/types';
import { useAnalytics, MusicPlatform } from '../hooks/useAnalytics';

interface MusicPanelProps {
  shoe: Shoe;
  isOpen: boolean;
  onClose: () => void;
}

const MusicPanel: React.FC<MusicPanelProps> = ({ shoe, isOpen, onClose }) => {
  const music = shoe.music;
  const { trackMusicClick } = useAnalytics();
  const [liked, setLiked] = useState(false);

  const handleMusicClick = (platform: MusicPlatform, url: string) => {
    if (music) {
      trackMusicClick(platform, shoe.id, music.song, music.artist);
    }
    window.open(url, '_blank');
  };

  // Extract Spotify track ID from URL for embed
  const getSpotifyTrackId = (url: string): string | null => {
    const match = url.match(/track\/([a-zA-Z0-9]+)/);
    return match ? match[1] : null;
  };

  if (!music) {
    return null;
  }

  const spotifyTrackId = music.spotifyUrl ? getSpotifyTrackId(music.spotifyUrl) : null;

  return (
    <>
      {/* Backdrop */}
      <div
        className={`fixed inset-0 bg-black/60 backdrop-blur-sm z-40 transition-opacity duration-300 ${
          isOpen ? 'opacity-100' : 'opacity-0 pointer-events-none'
        }`}
        onClick={onClose}
        aria-hidden="true"
      />

      {/* Panel */}
      <div
        role="dialog"
        aria-modal="true"
        aria-labelledby="music-panel-title"
        className={`fixed top-0 right-0 h-full w-full max-w-md bg-zinc-950 z-50 transform transition-transform duration-300 ease-out overflow-y-auto ${
          isOpen ? 'translate-x-0' : 'translate-x-full'
        }`}
      >
        {/* Header */}
        <div className="sticky top-0 bg-zinc-950/95 backdrop-blur-sm border-b border-zinc-800 p-4 flex items-center justify-between z-10">
          <h2 id="music-panel-title" className="text-lg font-bold text-white flex items-center gap-2">
            <FaMusic className="text-orange-500" />
            Now Playing
          </h2>
          <button
            onClick={onClose}
            aria-label="Close music panel"
            className="w-10 h-10 bg-zinc-800 rounded-full flex items-center justify-center text-white hover:bg-zinc-700 transition-colors"
          >
            <FaTimes aria-hidden="true" />
          </button>
        </div>

        {/* Spotify Embed Player - PLAYS ACTUAL MUSIC */}
        {spotifyTrackId && (
          <div className="p-4 bg-zinc-900">
            <iframe
              src={`https://open.spotify.com/embed/track/${spotifyTrackId}?utm_source=generator&theme=0`}
              width="100%"
              height="152"
              frameBorder="0"
              allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
              loading="lazy"
              className="rounded-xl"
              title={`${music.song} by ${music.artist}`}
            />
            <p className="text-zinc-500 text-xs text-center mt-2">
              ▶️ Press play above to preview
            </p>
          </div>
        )}

        {/* Song Info */}
        <div className="p-6 text-center border-b border-zinc-800">
          <h3 className="text-2xl font-black text-white mb-2">{music.song}</h3>
          <p className="text-lg text-zinc-400 mb-4">{music.artist}</p>

          {/* Like Button */}
          <button
            onClick={() => setLiked(!liked)}
            className={`inline-flex items-center gap-2 px-6 py-2 rounded-full font-bold transition-all ${
              liked
                ? 'bg-red-500 text-white'
                : 'bg-zinc-800 text-zinc-300 hover:bg-zinc-700'
            }`}
          >
            <FaHeart className={liked ? 'text-white' : ''} />
            {liked ? 'Liked!' : 'Like this song'}
          </button>
        </div>

        {/* GET THE FULL SONG - Affiliate Links */}
        <div className="p-6 space-y-3">
          <div className="text-center mb-4">
            <h4 className="text-white font-bold text-lg mb-1">🎵 Get the Full Song</h4>
            <p className="text-zinc-500 text-sm">Stream or download on your favorite platform</p>
          </div>

          {/* Apple Music - Best affiliate rates */}
          {music.appleMusicUrl && (
            <button
              onClick={() => handleMusicClick('apple_music', music.appleMusicUrl!)}
              aria-label={`Get ${music.song} on Apple Music`}
              className="w-full flex items-center gap-4 bg-gradient-to-r from-[#FA57C1] to-[#FC5C7D] hover:opacity-90 text-white font-bold py-4 px-6 rounded-xl transition-opacity shadow-lg"
            >
              <FaApple className="text-3xl" aria-hidden="true" />
              <div className="flex-1 text-left">
                <span className="block">Get on Apple Music</span>
                <span className="text-xs opacity-75">Free trial available</span>
              </div>
              <FaPlay className="text-sm" />
            </button>
          )}

          {/* Amazon Music */}
          {music.amazonMusicUrl && (
            <button
              onClick={() => handleMusicClick('amazon_music', music.amazonMusicUrl!)}
              aria-label={`Get ${music.song} on Amazon Music`}
              className="w-full flex items-center gap-4 bg-[#00A8E1] hover:bg-[#00bfff] text-white font-bold py-4 px-6 rounded-xl transition-colors shadow-lg"
            >
              <FaAmazon className="text-3xl" aria-hidden="true" />
              <div className="flex-1 text-left">
                <span className="block">Buy on Amazon Music</span>
                <span className="text-xs opacity-75">Own it forever</span>
              </div>
              <FaPlay className="text-sm" />
            </button>
          )}

          {/* Spotify - Free option */}
          {music.spotifyUrl && (
            <button
              onClick={() => handleMusicClick('spotify', music.spotifyUrl!)}
              aria-label={`Open ${music.song} in Spotify`}
              className="w-full flex items-center gap-4 bg-[#1DB954] hover:bg-[#1ed760] text-white font-bold py-4 px-6 rounded-xl transition-colors shadow-lg"
            >
              <FaSpotify className="text-3xl" aria-hidden="true" />
              <div className="flex-1 text-left">
                <span className="block">Open in Spotify</span>
                <span className="text-xs opacity-75">Free with ads</span>
              </div>
              <FaPlay className="text-sm" />
            </button>
          )}
        </div>

        {/* Paired With Sneaker */}
        <div className="p-6 border-t border-zinc-800">
          <p className="text-zinc-500 text-sm mb-3">🔥 Paired with</p>
          <div className="flex items-center gap-4 bg-zinc-900 p-4 rounded-xl">
            <img
              src={shoe.image_url}
              alt={shoe.name}
              className="w-16 h-16 rounded-lg object-cover"
            />
            <div className="flex-1">
              <p className="text-xs text-orange-500 font-bold uppercase">{shoe.brand}</p>
              <p className="text-white font-bold">{shoe.name}</p>
            </div>
          </div>
        </div>

        {/* Tip */}
        <div className="p-6 pb-8">
          <p className="text-zinc-600 text-xs text-center">
            🎧 Discover music that matches your sneaker style
          </p>
        </div>
      </div>
    </>
  );
};

export default MusicPanel;
