class AppRoutes {
  // Route paths
  static const String matches = '/matches';
  static const String settings = '/settings';

  // Route names
  static const String matchesName = 'matches';
  static const String matchDetailName = 'match-detail';
  static const String settingsName = 'settings';

  // Route parameters
  static const String matchIdParam = 'matchId';

  // Helper methods for building routes with parameters
  static String getMatchDetailRoute(String matchId) {
    return '$matches/match/$matchId';
  }
} 