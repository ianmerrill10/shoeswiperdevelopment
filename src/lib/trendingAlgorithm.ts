/**
 * Trending Feed Algorithm
 * Calculates trending score for sneakers based on engagement velocity
 * 
 * Factors:
 * - Recent view velocity (views in last 24h / total views)
 * - Click-through rate (clicks / views)
 * - Favorite ratio (favorites / views)
 * - Recency boost (newer items get slight boost)
 */

import { Shoe } from './types';

interface TrendingScore {
    shoeId: string;
    score: number;
    factors: {
        viewVelocity: number;
        ctr: number;
        favoriteRatio: number;
        recencyBoost: number;
    };
}

/**
 * Calculate trending score for a single shoe
 */
export function calculateTrendingScore(shoe: Shoe): TrendingScore {
    const { view_count, click_count, favorite_count, created_at } = shoe;

    // Prevent division by zero
    const views = Math.max(view_count, 1);

    // Click-through rate (0-1 range)
    const ctr = Math.min(click_count / views, 1);

    // Favorite ratio (0-1 range, typically low)
    const favoriteRatio = Math.min(favorite_count / views, 1);

    // Recency boost: items from last 7 days get up to 1.5x boost
    const daysSinceCreation = (Date.now() - new Date(created_at).getTime()) / (1000 * 60 * 60 * 24);
    const recencyBoost = daysSinceCreation <= 7 ? 1 + (0.5 * (1 - daysSinceCreation / 7)) : 1;

    // We don't have real-time velocity data, so estimate based on absolute numbers
    // In production, you'd track views per time period
    const viewVelocity = Math.min(view_count / 1000, 1); // Normalize to ~1000 views max

    // Weighted score calculation
    const score = (
        (viewVelocity * 0.3) +
        (ctr * 0.35) +
        (favoriteRatio * 0.25) +
        ((recencyBoost - 1) * 0.1)
    ) * 100;

    return {
        shoeId: shoe.id,
        score: Math.round(score * 100) / 100,
        factors: {
            viewVelocity: Math.round(viewVelocity * 100) / 100,
            ctr: Math.round(ctr * 100) / 100,
            favoriteRatio: Math.round(favoriteRatio * 100) / 100,
            recencyBoost: Math.round(recencyBoost * 100) / 100,
        },
    };
}

/**
 * Sort shoes by trending score
 */
export function sortByTrending(shoes: Shoe[]): Shoe[] {
    const scored = shoes.map(shoe => ({
        shoe,
        score: calculateTrendingScore(shoe).score,
    }));

    return scored
        .sort((a, b) => b.score - a.score)
        .map(item => item.shoe);
}

/**
 * Get top N trending shoes
 */
export function getTopTrending(shoes: Shoe[], limit: number = 10): Shoe[] {
    return sortByTrending(shoes).slice(0, limit);
}

/**
 * Filter shoes that are genuinely trending (score above threshold)
 */
export function filterTrending(shoes: Shoe[], minScore: number = 5): Shoe[] {
    return shoes.filter(shoe => calculateTrendingScore(shoe).score >= minScore);
}

/**
 * SQL function equivalent for Supabase
 * Add to schema.sql to enable server-side trending calculation
 */
export const TRENDING_SQL_FUNCTION = `
CREATE OR REPLACE FUNCTION get_trending_shoes(max_results INTEGER DEFAULT 20)
RETURNS SETOF shoes AS $$
BEGIN
  RETURN QUERY
  SELECT s.*
  FROM shoes s
  WHERE s.is_active = true
  ORDER BY (
    (LEAST(s.view_count::FLOAT / 1000, 1) * 0.3) +
    (LEAST(s.click_count::FLOAT / GREATEST(s.view_count, 1), 1) * 0.35) +
    (LEAST(s.favorite_count::FLOAT / GREATEST(s.view_count, 1), 1) * 0.25) +
    (CASE 
      WHEN s.created_at > NOW() - INTERVAL '7 days' 
      THEN 0.05 * (1 - EXTRACT(EPOCH FROM NOW() - s.created_at) / (7 * 24 * 60 * 60))
      ELSE 0 
    END)
  ) DESC
  LIMIT max_results;
END;
$$ LANGUAGE plpgsql STABLE;
`;

export default {
    calculateTrendingScore,
    sortByTrending,
    getTopTrending,
    filterTrending,
    TRENDING_SQL_FUNCTION,
};
