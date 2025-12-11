import React, { useState, useRef } from 'react';
import { motion, useMotionValue, useSpring, useTransform } from 'framer-motion';
import { FaCheck, FaSearch } from 'react-icons/fa';

interface BrandsStepProps {
  selectedBrands: string[];
  onBrandsChange: (brands: string[]) => void;
  onNext: () => void;
  onBack: () => void;
}

// Selection constraints - NO LIMITS, user can select as many as they want
const MIN_BRAND_SELECTIONS = 1;

// Comprehensive brand catalog - ONLY verified logos or text fallback (empty string)
const BRAND_OPTIONS = [
  // ATHLETIC / SNEAKERS - Wikipedia verified logos
  { id: 'nike', label: 'Nike', category: 'Athletic', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/200px-Logo_NIKE.svg.png' },
  { id: 'jordan', label: 'Jordan', category: 'Athletic', logo: 'https://upload.wikimedia.org/wikipedia/en/thumb/3/37/Jumpman_logo.svg/200px-Jumpman_logo.svg.png' },
  { id: 'adidas', label: 'Adidas', category: 'Athletic', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/200px-Adidas_Logo.svg.png' },
  { id: 'new-balance', label: 'New Balance', category: 'Athletic', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/New_Balance_logo.svg/200px-New_Balance_logo.svg.png' },
  { id: 'puma', label: 'Puma', category: 'Athletic', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Puma_AG.svg/200px-Puma_AG.svg.png' },
  { id: 'reebok', label: 'Reebok', category: 'Athletic', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Reebok_Logo.svg/200px-Reebok_Logo.svg.png' },
  { id: 'asics', label: 'ASICS', category: 'Athletic', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Asics_Logo.svg/200px-Asics_Logo.svg.png' },
  { id: 'under-armour', label: 'Under Armour', category: 'Athletic', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Under_armour_logo.svg/200px-Under_armour_logo.svg.png' },
  { id: 'fila', label: 'Fila', category: 'Athletic', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Fila_logo.svg/200px-Fila_logo.svg.png' },
  { id: 'saucony', label: 'Saucony', category: 'Athletic', logo: '' },

  // RUNNING / PERFORMANCE - Text only (no verified logos)
  { id: 'on-running', label: 'On', category: 'Running', logo: '' },
  { id: 'hoka', label: 'HOKA', category: 'Running', logo: '' },
  { id: 'brooks', label: 'Brooks', category: 'Running', logo: '' },
  { id: 'salomon', label: 'Salomon', category: 'Running', logo: '' },
  { id: 'mizuno', label: 'Mizuno', category: 'Running', logo: '' },

  // STREETWEAR / CASUAL
  { id: 'converse', label: 'Converse', category: 'Streetwear', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Converse_logo.svg/200px-Converse_logo.svg.png' },
  { id: 'vans', label: 'Vans', category: 'Streetwear', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Vans-logo.svg/200px-Vans-logo.svg.png' },
  { id: 'skechers', label: 'Skechers', category: 'Streetwear', logo: '' },

  // LUXURY / DESIGNER
  { id: 'yeezy', label: 'Yeezy', category: 'Luxury', logo: '' },
  { id: 'gucci', label: 'Gucci', category: 'Luxury', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/1960s_Gucci_Logo.svg/200px-1960s_Gucci_Logo.svg.png' },
  { id: 'louis-vuitton', label: 'Louis Vuitton', category: 'Luxury', logo: '' },
  { id: 'balenciaga', label: 'Balenciaga', category: 'Luxury', logo: '' },
  { id: 'prada', label: 'Prada', category: 'Luxury', logo: '' },
  { id: 'versace', label: 'Versace', category: 'Luxury', logo: '' },
  { id: 'alexander-mcqueen', label: 'McQueen', category: 'Luxury', logo: '' },
  { id: 'off-white', label: 'Off-White', category: 'Luxury', logo: '' },
  { id: 'fear-of-god', label: 'Fear of God', category: 'Luxury', logo: '' },

  // HIGH HEELS / WOMEN'S LUXURY
  { id: 'jimmy-choo', label: 'Jimmy Choo', category: 'Heels', logo: '' },
  { id: 'christian-louboutin', label: 'Louboutin', category: 'Heels', logo: '' },
  { id: 'manolo-blahnik', label: 'Manolo Blahnik', category: 'Heels', logo: '' },
  { id: 'stuart-weitzman', label: 'Stuart Weitzman', category: 'Heels', logo: '' },
  { id: 'giuseppe-zanotti', label: 'Zanotti', category: 'Heels', logo: '' },
  { id: 'steve-madden', label: 'Steve Madden', category: 'Heels', logo: '' },
  { id: 'aldo', label: 'ALDO', category: 'Heels', logo: '' },
  { id: 'nine-west', label: 'Nine West', category: 'Heels', logo: '' },

  // WORK BOOTS / OUTDOOR
  { id: 'timberland', label: 'Timberland', category: 'Boots', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Timberland_Logo.svg/200px-Timberland_Logo.svg.png' },
  { id: 'red-wing', label: 'Red Wing', category: 'Boots', logo: '' },
  { id: 'caterpillar', label: 'CAT', category: 'Boots', logo: '' },
  { id: 'dr-martens', label: 'Dr. Martens', category: 'Boots', logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Dr._Martens_logo.svg/200px-Dr._Martens_logo.svg.png' },
  { id: 'thorogood', label: 'Thorogood', category: 'Boots', logo: '' },
  { id: 'wolverine', label: 'Wolverine', category: 'Boots', logo: '' },
  { id: 'carhartt', label: 'Carhartt', category: 'Boots', logo: '' },
  { id: 'keen', label: 'KEEN', category: 'Boots', logo: '' },
  { id: 'merrell', label: 'Merrell', category: 'Boots', logo: '' },
  { id: 'danner', label: 'Danner', category: 'Boots', logo: '' },
  { id: 'blundstone', label: 'Blundstone', category: 'Boots', logo: '' },

  // SANDALS / COMFORT
  { id: 'birkenstock', label: 'Birkenstock', category: 'Comfort', logo: '' },
  { id: 'crocs', label: 'Crocs', category: 'Comfort', logo: '' },
  { id: 'teva', label: 'Teva', category: 'Comfort', logo: '' },
  { id: 'ugg', label: 'UGG', category: 'Comfort', logo: '' },
  { id: 'clarks', label: 'Clarks', category: 'Comfort', logo: '' },
  { id: 'ecco', label: 'ECCO', category: 'Comfort', logo: '' },

  // SKATE / ACTION SPORTS
  { id: 'dc-shoes', label: 'DC', category: 'Skate', logo: '' },
  { id: 'etnies', label: 'Etnies', category: 'Skate', logo: '' },
  { id: 'lakai', label: 'Lakai', category: 'Skate', logo: '' },

  // FORMAL / DRESS
  { id: 'cole-haan', label: 'Cole Haan', category: 'Formal', logo: '' },
  { id: 'allen-edmonds', label: 'Allen Edmonds', category: 'Formal', logo: '' },
  { id: 'church', label: "Church's", category: 'Formal', logo: '' },
  { id: 'florsheim', label: 'Florsheim', category: 'Formal', logo: '' },
  { id: 'johnston-murphy', label: 'J&M', category: 'Formal', logo: '' },
];

const CATEGORIES = ['All', 'Athletic', 'Running', 'Streetwear', 'Luxury', 'Heels', 'Boots', 'Comfort', 'Skate', 'Formal'];

// Holographic Brand Card Component
const BrandCard: React.FC<{
  brand: typeof BRAND_OPTIONS[0];
  isSelected: boolean;
  onToggle: () => void;
  index: number;
}> = ({ brand, isSelected, onToggle, index }) => {
  const cardRef = useRef<HTMLButtonElement>(null);

  // Mouse position for holographic effect
  const mouseX = useMotionValue(0);
  const mouseY = useMotionValue(0);

  // Spring for smooth pudding-like movement
  const springConfig = { stiffness: 100, damping: 15 };
  const rotateX = useSpring(useTransform(mouseY, [-0.5, 0.5], [8, -8]), springConfig);
  const rotateY = useSpring(useTransform(mouseX, [-0.5, 0.5], [-8, 8]), springConfig);

  // Holographic gradient position
  const gradientX = useSpring(useTransform(mouseX, [-0.5, 0.5], [0, 100]), springConfig);
  const gradientY = useSpring(useTransform(mouseY, [-0.5, 0.5], [0, 100]), springConfig);

  const handleMouseMove = (e: React.MouseEvent<HTMLButtonElement>) => {
    if (!cardRef.current) return;
    const rect = cardRef.current.getBoundingClientRect();
    const x = (e.clientX - rect.left) / rect.width - 0.5;
    const y = (e.clientY - rect.top) / rect.height - 0.5;
    mouseX.set(x);
    mouseY.set(y);
  };

  const handleMouseLeave = () => {
    mouseX.set(0);
    mouseY.set(0);
  };

  return (
    <motion.button
      ref={cardRef}
      initial={{ opacity: 0, scale: 0.8, y: 20 }}
      animate={{ opacity: 1, scale: 1, y: 0 }}
      transition={{ delay: 0.02 * index, duration: 0.4 }}
      whileTap={{ scale: 0.95 }}
      onClick={onToggle}
      onMouseMove={handleMouseMove}
      onMouseLeave={handleMouseLeave}
      style={{
        rotateX,
        rotateY,
        transformStyle: 'preserve-3d',
      }}
      className={`relative rounded-2xl p-3 flex flex-col items-center justify-center gap-2 transition-all duration-300 aspect-square overflow-hidden cursor-pointer group ${isSelected
        ? 'ring-2 ring-sky-400 shadow-xl shadow-sky-400/30'
        : 'hover:shadow-lg hover:shadow-white/10'
        }`}
    >
      {/* Holographic Background Layer - Clean steel/sky tones */}
      <motion.div
        className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-500"
        style={{
          background: `
            radial-gradient(circle at ${gradientX}% ${gradientY}%, 
              rgba(255,255,255,0.4) 0%, 
              rgba(56,189,248,0.15) 30%, 
              rgba(139,92,246,0.1) 60%,
              transparent 100%)
          `,
        }}
      />

      {/* Glass effect base - Clean slate with subtle purple */}
      <div className={`absolute inset-0 rounded-2xl backdrop-blur-xl transition-all duration-300 ${isSelected
        ? 'bg-gradient-to-br from-sky-900/40 via-slate-800/60 to-violet-900/30'
        : 'bg-slate-800/50 group-hover:bg-slate-700/60'
        }`} />

      {/* Shimmer overlay on hover */}
      <motion.div
        className="absolute inset-0 opacity-0 group-hover:opacity-100"
        style={{
          background: `linear-gradient(
            135deg,
            transparent 30%,
            rgba(255,255,255,0.1) 50%,
            transparent 70%
          )`,
          backgroundSize: '200% 200%',
        }}
        animate={{
          backgroundPosition: ['200% 200%', '-200% -200%'],
        }}
        transition={{
          duration: 3,
          repeat: Infinity,
          ease: 'linear',
        }}
      />

      {/* Selected Checkmark */}
      {isSelected && (
        <motion.div
          initial={{ scale: 0, rotate: -180 }}
          animate={{ scale: 1, rotate: 0 }}
          className="absolute top-2 right-2 w-8 h-8 bg-gradient-to-r from-sky-400 to-blue-500 rounded-full flex items-center justify-center shadow-lg z-20"
        >
          <FaCheck className="text-sm text-white" />
        </motion.div>
      )}

      {/* HUGE Logo/Text Display */}
      <motion.div
        className="relative z-10 w-full h-full flex items-center justify-center p-3"
        style={{ transform: 'translateZ(20px)' }}
      >
        {brand.logo ? (
          // Has logo - show image
          <img
            src={brand.logo}
            alt={brand.label}
            className={`w-full h-full object-contain transition-all duration-300 drop-shadow-lg ${isSelected
                ? 'brightness-110 scale-105'
                : 'brightness-100 group-hover:brightness-110 group-hover:scale-105'
              }`}
            style={{
              maxWidth: '85%',
              maxHeight: '65%',
              filter: isSelected ? 'drop-shadow(0 0 15px rgba(56, 189, 248, 0.6))' : 'none'
            }}
            onError={(e) => {
              // Hide broken image, show text fallback
              e.currentTarget.style.display = 'none';
              const fallback = e.currentTarget.nextElementSibling;
              if (fallback) fallback.classList.remove('hidden');
            }}
          />
        ) : null}

        {/* Text display for brands without logos - HUGE and BOLD */}
        <span
          className={`${brand.logo ? 'hidden' : ''} text-center font-black leading-tight transition-all duration-300 ${isSelected
              ? 'text-white drop-shadow-lg'
              : 'text-zinc-200 group-hover:text-white'
            }`}
          style={{
            fontSize: brand.label.length > 10 ? '1.25rem' : brand.label.length > 6 ? '1.5rem' : '2rem',
            textShadow: isSelected ? '0 0 20px rgba(56, 189, 248, 0.5)' : 'none'
          }}
        >
          {brand.label}
        </span>
      </motion.div>

      {/* Label at bottom - only show if we have a logo */}
      {brand.logo && (
        <motion.span
          className={`absolute bottom-2 left-0 right-0 text-center z-10 text-sm font-bold transition-all duration-300 ${isSelected ? 'text-white' : 'text-zinc-400 group-hover:text-white'
            }`}
          style={{ transform: 'translateZ(15px)' }}
        >
          {brand.label}
        </motion.span>
      )}
    </motion.button>
  );
};

const BrandsStep: React.FC<BrandsStepProps> = ({
  selectedBrands,
  onBrandsChange,
  onNext,
  onBack,
}) => {
  const [brands, setBrands] = useState<string[]>(selectedBrands);
  const [searchQuery, setSearchQuery] = useState('');
  const [activeCategory, setActiveCategory] = useState('All');

  const toggleBrand = (brandId: string) => {
    // No limit on selections - user can pick as many as they want
    const newBrands = brands.includes(brandId)
      ? brands.filter(b => b !== brandId)
      : [...brands, brandId];
    setBrands(newBrands);
    onBrandsChange(newBrands);
  };

  const filteredBrands = BRAND_OPTIONS.filter(brand => {
    const matchesSearch = brand.label.toLowerCase().includes(searchQuery.toLowerCase());
    const matchesCategory = activeCategory === 'All' || brand.category === activeCategory;
    return matchesSearch && matchesCategory;
  });

  const canContinue = brands.length >= MIN_BRAND_SELECTIONS;

  return (
    <motion.div
      initial={{ opacity: 0, x: 50 }}
      animate={{ opacity: 1, x: 0 }}
      exit={{ opacity: 0, x: -50 }}
      transition={{ duration: 0.3 }}
      className="flex flex-col min-h-full px-4 py-6"
    >
      {/* Header - BIG AND BOLD */}
      <div className="text-center mb-6">
        <motion.h1
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.1 }}
          className="text-4xl md:text-5xl font-black text-white mb-2 leading-tight"
        >
          Choose Your{' '}
          <span className="bg-gradient-to-r from-sky-400 via-blue-500 to-violet-500 bg-clip-text text-transparent">
            Brands
          </span>
        </motion.h1>
        <motion.p
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="text-zinc-400 text-base"
        >
          Pick your favorites • {brands.length} selected
        </motion.p>
      </div>

      {/* Search Bar */}
      <motion.div
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.25 }}
        className="relative mb-3"
      >
        <FaSearch className="absolute left-3 top-1/2 -translate-y-1/2 text-zinc-500 text-sm" />
        <input
          type="text"
          placeholder="Search brands..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="w-full bg-zinc-800/50 border border-zinc-700/50 rounded-xl pl-10 pr-4 py-2.5 text-white text-sm placeholder-zinc-500 focus:border-purple-500 focus:outline-none"
        />
      </motion.div>

      {/* Category Tabs */}
      <motion.div
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.3 }}
        className="flex gap-2 overflow-x-auto pb-3 mb-3 scrollbar-hide"
      >
        {CATEGORIES.map((category) => (
          <button
            key={category}
            onClick={() => setActiveCategory(category)}
            className={`flex-shrink-0 px-3 py-1.5 rounded-full text-xs font-medium transition-all ${activeCategory === category
              ? 'bg-gradient-to-r from-purple-500 to-pink-500 text-white'
              : 'bg-zinc-800/50 text-zinc-400 hover:text-white hover:bg-zinc-700/50'
              }`}
          >
            {category}
          </button>
        ))}
      </motion.div>

      {/* Brands Grid - Scrollable */}
      <div className="flex-1 overflow-y-auto -mx-4 px-4 pb-4" style={{ perspective: '1000px' }}>
        <div className="grid grid-cols-4 gap-2">
          {filteredBrands.map((brand, index) => (
            <BrandCard
              key={brand.id}
              brand={brand}
              isSelected={brands.includes(brand.id)}
              onToggle={() => toggleBrand(brand.id)}
              index={index}
            />
          ))}
        </div>

        {filteredBrands.length === 0 && (
          <div className="text-center py-12">
            <p className="text-zinc-500">No brands found</p>
          </div>
        )}
      </div>

      {/* Selection Counter */}
      <motion.div
        className="text-center py-2"
        animate={{
          scale: brands.length >= MIN_BRAND_SELECTIONS ? [1, 1.05, 1] : 1,
        }}
      >
        <span className={`text-sm font-medium ${brands.length >= MIN_BRAND_SELECTIONS ? 'text-green-400' : 'text-zinc-500'
          }`}>
          {brands.length} brands selected
        </span>
      </motion.div>

      {/* Navigation Buttons */}
      <div className="flex gap-3 pt-2">
        <motion.button
          whileHover={{ scale: 1.02 }}
          whileTap={{ scale: 0.98 }}
          onClick={onBack}
          className="flex-1 bg-zinc-800 text-white font-bold py-3.5 rounded-xl"
        >
          Back
        </motion.button>
        <motion.button
          whileHover={{ scale: canContinue ? 1.02 : 1 }}
          whileTap={{ scale: canContinue ? 0.98 : 1 }}
          onClick={onNext}
          disabled={!canContinue}
          className={`flex-1 font-bold py-3.5 rounded-xl transition-all ${canContinue
            ? 'bg-gradient-to-r from-purple-500 via-pink-500 to-orange-500 text-white shadow-lg shadow-purple-500/30'
            : 'bg-zinc-800 text-zinc-500 cursor-not-allowed'
            }`}
        >
          Continue
        </motion.button>
      </div>
    </motion.div>
  );
};

export default BrandsStep;
