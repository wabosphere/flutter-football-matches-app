import 'package:shared_preferences/shared_preferences.dart';

/// App configuration and mode settings
enum AppMode { demo, live }

class AppConfig {
  static bool _isDemo = true; // Default fallback

  /// Initialize config from SharedPreferences
  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _isDemo = prefs.getBool('app_mode') ?? true;
  }

  /// Check if app is running in demo mode
  static bool get isDemo => _isDemo;

  /// Check if app is running in live mode
  static bool get isLive => !_isDemo;

  // Demo mode uses mock API endpoints
  static const String demoApiBaseUrl = 'http://localhost:8000';

  // Live mode uses production API
  static const String liveApiBaseUrl = 'https://staging.torliga.com/api/v1';

  static String get apiBaseUrl => isDemo ? demoApiBaseUrl : liveApiBaseUrl;

  // WebSocket configuration
  static const String demoWebSocketUrl = 'ws://localhost:8000/matches';
  static const String liveWebSocketUrl = 'wss://staging.torliga.com/matches';

  static String get webSocketUrl => isDemo ? demoWebSocketUrl : liveWebSocketUrl;
}

