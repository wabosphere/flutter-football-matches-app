/// App configuration and mode settings
enum AppMode { demo, live }

class AppConfig {
  /// Change this to AppMode.demo for testing with mock data
  /// Change to AppMode.live for production with real API
  static const AppMode currentMode = AppMode.live;

  /// Check if app is running in demo mode
  static bool get isDemo => currentMode == AppMode.demo;

  /// Check if app is running in live mode
  static bool get isLive => currentMode == AppMode.live;

  // Demo mode uses mock API endpoints
  static const String demoApiBaseUrl = 'http://localhost:8000';

  // Live mode uses production API
  static const String liveApiBaseUrl = 'https://api.example.com';

  static String get apiBaseUrl => isDemo ? demoApiBaseUrl : liveApiBaseUrl;

  // WebSocket configuration
  static const String demoWebSocketUrl = 'ws://localhost:8000/matches';
  static const String liveWebSocketUrl = 'wss://api.example.com/matches';

  static String get webSocketUrl => isDemo ? demoWebSocketUrl : liveWebSocketUrl;
}
