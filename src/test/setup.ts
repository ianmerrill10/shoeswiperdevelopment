import '@testing-library/jest-dom';

declare const vi: typeof import('vitest').vi;

const IGNORED_CONSOLE_PATTERNS: RegExp[] = [
  /^\[Demo\]/,
  /^\[MockData\]/,
  /React Router Future Flag Warning/, 
];

const shouldIgnoreConsoleMessage = (args: unknown[]): boolean => {
  const first = args[0];
  const message = typeof first === 'string' ? first : first instanceof Error ? first.message : String(first);
  return IGNORED_CONSOLE_PATTERNS.some((pattern) => pattern.test(message));
};

const originalWarn = console.warn.bind(console);
const originalError = console.error.bind(console);

vi.spyOn(console, 'warn').mockImplementation((...args: unknown[]) => {
  if (shouldIgnoreConsoleMessage(args)) return;
  originalWarn(...args);
});

vi.spyOn(console, 'error').mockImplementation((...args: unknown[]) => {
  if (shouldIgnoreConsoleMessage(args)) return;
  originalError(...args);
});

// Mock window.matchMedia for tests that use responsive design
Object.defineProperty(window, 'matchMedia', {
  writable: true,
  value: (query: string) => ({
    matches: false,
    media: query,
    onchange: null,
    addListener: () => { },
    removeListener: () => { },
    addEventListener: () => { },
    removeEventListener: () => { },
    dispatchEvent: () => { },
  }),
});

// Mock IntersectionObserver for tests that use lazy loading or visibility detection
(globalThis as typeof globalThis & { IntersectionObserver: typeof IntersectionObserver }).IntersectionObserver = class IntersectionObserver {
  constructor() { }
  disconnect() { }
  observe() { }
  takeRecords(): IntersectionObserverEntry[] {
    return [];
  }
  unobserve() { }
} as unknown as { new(): IntersectionObserver; prototype: IntersectionObserver };
