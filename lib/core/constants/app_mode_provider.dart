import 'package:shared_preferences/shared_preferences.dart';

class AppModeProvider {
  static const String _modeKey = 'app_mode';

  static Future<bool> isDemoMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_modeKey) ?? true; // Default to demo
  }

  static Future<void> setDemoMode(bool isDemo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_modeKey, isDemo);
  }

  static Future<String> getCurrentMode() async {
    final isDemo = await isDemoMode();
    return isDemo ? 'DEMO' : 'LIVE';
  }
}
