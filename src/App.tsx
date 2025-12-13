import { useState, useEffect, Suspense, lazy } from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { useAuthGuard } from './hooks/useAuthGuard';

// Lazy-loaded Pages
const SwipeFeedPage = lazy(() => import('./pages/SwipeFeedPage'));
const SearchPage = lazy(() => import('./pages/SearchPage'));
const ClosetPage = lazy(() => import('./pages/ClosetPage'));
const CheckMyFit = lazy(() => import('./pages/CheckMyFit'));
const ProfilePage = lazy(() => import('./pages/ProfilePage'));
const AuthPage = lazy(() => import('./pages/AuthPage'));
const ComingSoon = lazy(() => import('./pages/ComingSoon'));
const Unauthorized = lazy(() => import('./pages/Unauthorized'));
const NFTMarketplace = lazy(() => import('./components/nft/NFTMarketplace'));

// Lazy-loaded Admin Pages
const AnalyticsDashboard = lazy(() => import('./pages/admin/AnalyticsDashboard').then(m => ({ default: m.AnalyticsDashboard })));
const ProductManager = lazy(() => import('./pages/admin/ProductManager').then(m => ({ default: m.ProductManager })));
const UserManager = lazy(() => import('./pages/admin/UserManager').then(m => ({ default: m.UserManager })));

// Static imports for layout and essential components
import { AdminLayout } from './components/admin/AdminLayout';
import BottomNavigation from './components/BottomNavigation';
import OnboardingFlow from './components/OnboardingFlow';
import LoadingSpinner from './components/LoadingSpinner';
import ErrorBoundary from './components/ErrorBoundary';
import ExitIntentPopup from './components/ExitIntentPopup';

const NotFoundPage = lazy(() => import('./pages/NotFoundPage'));

const ONBOARDING_KEY = 'shoeswiper_onboarding';

function App() {
  const { user, loading, isAllowed } = useAuthGuard();
  const [showOnboarding, setShowOnboarding] = useState(false);
  const [onboardingChecked, setOnboardingChecked] = useState(false);

  // Skip onboarding - go straight to shoe swiping
  useEffect(() => {
    // Auto-complete onboarding for new users so they see shoes immediately
    const stored = localStorage.getItem(ONBOARDING_KEY);
    if (!stored) {
      localStorage.setItem(ONBOARDING_KEY, JSON.stringify({ completed: true }));
    }
    setShowOnboarding(false);
    setOnboardingChecked(true);
  }, []);

  const handleOnboardingComplete = () => {
    setShowOnboarding(false);
  };

  if (loading || !onboardingChecked) {
    return <LoadingSpinner message="Loading ShoeSwiper..." />;
  }

  // If user is logged in but not in allowed list, show Unauthorized page
  if (user && !isAllowed) {
    return (
      <Suspense fallback={<LoadingSpinner />}>
        <Routes>
          <Route path="*" element={<Unauthorized />} />
        </Routes>
      </Suspense>
    );
  }

  // If not logged in or not allowed, show Coming Soon (except for /auth route)
  if (!isAllowed) {
    return (
      <Suspense fallback={<LoadingSpinner />}>
        <Routes>
          <Route path="/auth" element={<AuthPage />} />
          <Route path="*" element={<ComingSoon />} />
        </Routes>
      </Suspense>
    );
  }

  // User is authenticated and allowed - show full app
  // If onboarding is being shown, render it as a full overlay
  if (showOnboarding) {
    return <OnboardingFlow onComplete={handleOnboardingComplete} />;
  }

  return (
    <div className="min-h-screen bg-zinc-950">
      <ErrorBoundary>
        {/* Skip to main content link for keyboard users */}
        <a
          href="#main-content"
          className="sr-only focus:not-sr-only focus:absolute focus:top-4 focus:left-4 focus:z-50 focus:bg-orange-500 focus:text-white focus:px-4 focus:py-2 focus:rounded-lg focus:font-bold"
        >
          Skip to main content
        </a>
        <Suspense fallback={<LoadingSpinner />}>
          <main id="main-content" role="main">
            <Routes>
              {/* Auth Routes */}
              <Route path="/auth" element={<Navigate to="/" />} />

              {/* Main App Routes */}
              <Route path="/" element={<SwipeFeedPage />} />
              <Route path="/search" element={<SearchPage />} />
              <Route path="/closet" element={<ClosetPage />} />
              <Route path="/check-fit" element={<CheckMyFit />} />
              <Route path="/profile" element={<ProfilePage />} />
              <Route path="/nft" element={<NFTMarketplace />} />

              {/* Admin Routes - Protected by AdminLayout */}
              <Route path="/admin" element={<AdminLayout />}>
                <Route index element={<AnalyticsDashboard />} />
                <Route path="products" element={<ProductManager />} />
                <Route path="users" element={<UserManager />} />
              </Route>

              {/* 404 */}
              <Route path="*" element={<NotFoundPage />} />
            </Routes>
          </main>
        </Suspense>

        {/* Bottom Navigation - shown on main pages */}
        {!['/auth', '/admin'].some(path => window.location.pathname.startsWith(path)) && (
          <BottomNavigation />
        )}

        {/* Global Exit Intent Popup */}
        <ExitIntentPopup />
      </ErrorBoundary>
    </div>
  );
}

export default App;
