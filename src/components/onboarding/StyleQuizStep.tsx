import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { FaCheck } from 'react-icons/fa';

interface StyleQuizStepProps {
  selectedStyles: string[];
  onStylesChange: (styles: string[]) => void;
  onNext: () => void;
  onBack: () => void;
}

// No limits - user can select as many styles as they want
const MIN_STYLE_SELECTIONS = 1;

const STYLE_OPTIONS = [
  { id: 'streetwear', label: 'Streetwear', emoji: '🔥', color: 'from-red-600 to-amber-500', bgImage: 'linear-gradient(135deg, #dc2626 0%, #f59e0b 100%)' },
  { id: 'classic', label: 'Classic', emoji: '👔', color: 'from-slate-600 to-zinc-400', bgImage: 'linear-gradient(135deg, #475569 0%, #a1a1aa 100%)' },
  { id: 'high-fashion', label: 'High Fashion', emoji: '💎', color: 'from-violet-600 to-fuchsia-400', bgImage: 'linear-gradient(135deg, #7c3aed 0%, #e879f9 100%)' },
  { id: 'athletic', label: 'Athletic', emoji: '⚡', color: 'from-emerald-600 to-teal-400', bgImage: 'linear-gradient(135deg, #059669 0%, #2dd4bf 100%)' },
  { id: 'casual', label: 'Casual', emoji: '😎', color: 'from-sky-600 to-blue-400', bgImage: 'linear-gradient(135deg, #0284c7 0%, #60a5fa 100%)' },
  { id: 'luxury', label: 'Luxury', emoji: '👑', color: 'from-amber-500 to-yellow-300', bgImage: 'linear-gradient(135deg, #f59e0b 0%, #fde047 100%)' },
  { id: 'skate', label: 'Skate', emoji: '🛹', color: 'from-rose-600 to-pink-400', bgImage: 'linear-gradient(135deg, #e11d48 0%, #f472b6 100%)' },
  { id: 'basketball', label: 'Hoops', emoji: '🏀', color: 'from-orange-600 to-red-500', bgImage: 'linear-gradient(135deg, #ea580c 0%, #ef4444 100%)' },
  { id: 'running', label: 'Running', emoji: '🏃', color: 'from-cyan-500 to-blue-500', bgImage: 'linear-gradient(135deg, #06b6d4 0%, #3b82f6 100%)' },
  { id: 'hiking', label: 'Outdoor', emoji: '🏔️', color: 'from-green-700 to-lime-500', bgImage: 'linear-gradient(135deg, #15803d 0%, #84cc16 100%)' },
  { id: 'formal', label: 'Formal', emoji: '🎩', color: 'from-gray-800 to-gray-500', bgImage: 'linear-gradient(135deg, #1f2937 0%, #6b7280 100%)' },
  { id: 'y2k', label: 'Y2K', emoji: '💿', color: 'from-fuchsia-500 to-cyan-400', bgImage: 'linear-gradient(135deg, #d946ef 0%, #22d3ee 100%)' },
];

const StyleQuizStep: React.FC<StyleQuizStepProps> = ({
  selectedStyles,
  onStylesChange,
  onNext,
  onBack,
}) => {
  const [styles, setStyles] = useState<string[]>(selectedStyles);

  const toggleStyle = (styleId: string) => {
    // No limit on selections
    const newStyles = styles.includes(styleId)
      ? styles.filter(s => s !== styleId)
      : [...styles, styleId];
    setStyles(newStyles);
    onStylesChange(newStyles);
  };

  const canContinue = styles.length >= MIN_STYLE_SELECTIONS;

  return (
    <motion.div
      initial={{ opacity: 0, x: 50 }}
      animate={{ opacity: 1, x: 0 }}
      exit={{ opacity: 0, x: -50 }}
      transition={{ duration: 0.3 }}
      className="flex flex-col min-h-full px-4 py-6"
    >
      {/* MASSIVE Header */}
      <div className="text-center mb-8">
        <motion.h1
          initial={{ opacity: 0, y: 20, scale: 0.9 }}
          animate={{ opacity: 1, y: 0, scale: 1 }}
          transition={{ delay: 0.1, type: 'spring', stiffness: 200 }}
          className="text-5xl md:text-6xl font-black text-white mb-3 tracking-tight"
        >
          What's Your{' '}
          <span className="bg-gradient-to-r from-sky-400 via-blue-500 to-violet-500 bg-clip-text text-transparent">
            Style
          </span>
          ?
        </motion.h1>
        <motion.p
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="text-zinc-300 text-lg font-medium"
        >
          Pick styles that match your vibe • {styles.length} selected
        </motion.p>
      </div>

      {/* HUGE Style Grid */}
      <div className="grid grid-cols-2 md:grid-cols-3 gap-4 flex-1 mb-6 overflow-y-auto">
        {STYLE_OPTIONS.map((style, index) => {
          const isSelected = styles.includes(style.id);
          return (
            <motion.button
              key={style.id}
              initial={{ opacity: 0, scale: 0.8, y: 30 }}
              animate={{ opacity: 1, scale: 1, y: 0 }}
              transition={{ delay: 0.05 + index * 0.04, type: 'spring', stiffness: 300, damping: 20 }}
              whileHover={{ scale: 1.05, y: -5 }}
              whileTap={{ scale: 0.95 }}
              onClick={() => toggleStyle(style.id)}
              className={`relative rounded-3xl p-6 flex flex-col items-center justify-center gap-3 transition-all duration-300 min-h-[140px] overflow-hidden ${isSelected
                  ? 'shadow-2xl ring-4 ring-white/50'
                  : 'bg-slate-800/60 border-2 border-slate-700/50 hover:border-slate-500'
                }`}
              style={{
                background: isSelected ? style.bgImage : undefined,
              }}
            >
              {/* Glow effect when selected */}
              {isSelected && (
                <motion.div
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  className="absolute inset-0 rounded-3xl"
                  style={{
                    background: style.bgImage,
                    filter: 'blur(20px)',
                    opacity: 0.5,
                    transform: 'scale(1.1)',
                    zIndex: -1,
                  }}
                />
              )}

              {/* Selected Checkmark */}
              {isSelected && (
                <motion.div
                  initial={{ scale: 0, rotate: -180 }}
                  animate={{ scale: 1, rotate: 0 }}
                  className="absolute top-3 right-3 w-8 h-8 bg-white rounded-full flex items-center justify-center shadow-lg"
                >
                  <FaCheck className="text-sm text-gray-900" />
                </motion.div>
              )}

              {/* MASSIVE Emoji */}
              <motion.span
                className="text-6xl md:text-7xl filter drop-shadow-lg"
                animate={{
                  scale: isSelected ? [1, 1.1, 1] : 1,
                  rotate: isSelected ? [0, -5, 5, 0] : 0,
                }}
                transition={{ duration: 0.5 }}
              >
                {style.emoji}
              </motion.span>

              {/* Label - BIG and BOLD */}
              <span className={`text-xl md:text-2xl font-black tracking-wide ${isSelected ? 'text-white drop-shadow-lg' : 'text-zinc-200'
                }`}>
                {style.label}
              </span>
            </motion.button>
          );
        })}
      </div>

      {/* Navigation Buttons */}
      <div className="flex gap-3 pt-2">
        <motion.button
          whileHover={{ scale: 1.02 }}
          whileTap={{ scale: 0.98 }}
          onClick={onBack}
          className="flex-1 bg-slate-800 text-white font-bold py-4 rounded-2xl text-lg border border-slate-700"
        >
          Back
        </motion.button>
        <motion.button
          whileHover={{ scale: canContinue ? 1.02 : 1 }}
          whileTap={{ scale: canContinue ? 0.98 : 1 }}
          onClick={onNext}
          disabled={!canContinue}
          className={`flex-1 font-black py-4 rounded-2xl text-lg transition-all ${canContinue
              ? 'bg-gradient-to-r from-sky-500 via-blue-500 to-violet-500 text-white shadow-lg shadow-blue-500/30'
              : 'bg-slate-800 text-slate-500 cursor-not-allowed'
            }`}
        >
          Continue →
        </motion.button>
      </div>
    </motion.div>
  );
};

export default StyleQuizStep;
