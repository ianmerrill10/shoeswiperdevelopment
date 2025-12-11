/**
 * AI Outfit Analysis Edge Function
 * Supabase Edge Function for analyzing outfit images with Google Gemini Vision
 * 
 * Deploy with: supabase functions deploy analyze-outfit
 * 
 * Required secrets:
 * - GOOGLE_AI_API_KEY (Google Gemini API key)
 */

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const GOOGLE_AI_API_KEY = Deno.env.get('GOOGLE_AI_API_KEY') || '';
const GEMINI_API_URL = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

interface AnalysisRequest {
  image: string; // Base64 encoded image
}

interface AnalysisResult {
  rating: number;
  style_tags: string[];
  dominant_colors: string[];
  detected_shoe: string;
  feedback: string;
}

const ANALYSIS_PROMPT = `Analyze this outfit image for sneaker matching. Return a JSON object with:
{
  "rating": <1-10 overall style rating>,
  "style_tags": <array of 3-5 style categories like "streetwear", "casual", "athletic", "formal", "vintage", "minimalist", "bold">,
  "dominant_colors": <array of 2-4 dominant colors in the outfit>,
  "detected_shoe": <describe any shoes visible, or "none detected" if no shoes>,
  "feedback": <2-3 sentence style analysis and sneaker recommendation context>
}

Be accurate and focused on sneaker matching. Return ONLY valid JSON, no markdown.`;

serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  if (!GOOGLE_AI_API_KEY) {
    return new Response(
      JSON.stringify({
        error: 'AI service not configured',
        message: 'Set GOOGLE_AI_API_KEY secret',
        // Return fallback mock data
        rating: 7,
        style_tags: ['casual', 'streetwear'],
        dominant_colors: ['black', 'white'],
        detected_shoe: 'Manual analysis required',
        feedback: 'AI analysis unavailable. Please select your style manually for recommendations.',
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }

  try {
    const { image }: AnalysisRequest = await req.json();

    if (!image) {
      return new Response(
        JSON.stringify({ error: 'No image provided' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Call Gemini Vision API
    const response = await fetch(`${GEMINI_API_URL}?key=${GOOGLE_AI_API_KEY}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        contents: [
          {
            parts: [
              { text: ANALYSIS_PROMPT },
              {
                inlineData: {
                  mimeType: 'image/jpeg',
                  data: image,
                },
              },
            ],
          },
        ],
        generationConfig: {
          temperature: 0.4,
          topK: 32,
          topP: 1,
          maxOutputTokens: 1024,
        },
      }),
    });

    if (!response.ok) {
      const errorText = await response.text();
      console.error('Gemini API error:', errorText);
      throw new Error(`AI API error: ${response.status}`);
    }

    const data = await response.json();
    const textContent = data.candidates?.[0]?.content?.parts?.[0]?.text;

    if (!textContent) {
      throw new Error('No response from AI');
    }

    // Parse JSON from response
    let result: AnalysisResult;
    try {
      // Clean up potential markdown formatting
      const cleanJson = textContent.replace(/```json\n?/g, '').replace(/```\n?/g, '').trim();
      result = JSON.parse(cleanJson);
    } catch (parseError) {
      console.error('Failed to parse AI response:', textContent);
      // Return a safe fallback
      result = {
        rating: 7,
        style_tags: ['casual', 'streetwear'],
        dominant_colors: ['neutral'],
        detected_shoe: 'Analysis incomplete',
        feedback: 'Could not fully analyze the image. Here are general recommendations based on popular styles.',
      };
    }

    // Validate and normalize
    result.rating = Math.max(1, Math.min(10, result.rating || 7));
    result.style_tags = Array.isArray(result.style_tags) ? result.style_tags.slice(0, 5) : ['casual'];
    result.dominant_colors = Array.isArray(result.dominant_colors) ? result.dominant_colors.slice(0, 4) : ['black'];

    return new Response(JSON.stringify(result), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error('Edge function error:', error);
    return new Response(
      JSON.stringify({
        error: 'Analysis failed',
        message: error instanceof Error ? error.message : 'Unknown error',
        // Fallback response
        rating: 7,
        style_tags: ['casual'],
        dominant_colors: ['neutral'],
        detected_shoe: 'Error in analysis',
        feedback: 'Analysis failed. Please try again or select your style manually.',
      }),
      { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
    );
  }
});
