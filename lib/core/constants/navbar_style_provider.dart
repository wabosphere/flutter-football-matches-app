import 'package:shared_preferences/shared_preferences.dart';

enum BottomNavStyle { elegant, stylish }
enum ElegantNavBarStyle { simple, floating, image }
enum StylishNavBarStyle { style1, style2, style3, style4, style5, style6 }

class NavBarStyleProvider {
  static const String _styleKey = 'bottom_nav_style';
  static const String _elegantStyleKey = 'elegant_nav_style';
  static const String _stylishStyleKey = 'stylish_nav_style';

  // Default: ElegantNavBar with Floating style
  static Future<BottomNavStyle> getNavStyle() async {
    final prefs = await SharedPreferences.getInstance();
    final styleString = prefs.getString(_styleKey) ?? 'elegant';
    return styleString == 'elegant' ? BottomNavStyle.elegant : BottomNavStyle.stylish;
  }

  static Future<void> setNavStyle(BottomNavStyle style) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_styleKey, style == BottomNavStyle.elegant ? 'elegant' : 'stylish');
  }

  static Future<ElegantNavBarStyle> getElegantStyle() async {
    final prefs = await SharedPreferences.getInstance();
    final styleString = prefs.getString(_elegantStyleKey) ?? 'floating';
    switch (styleString) {
      case 'simple':
        return ElegantNavBarStyle.simple;
      case 'floating':
        return ElegantNavBarStyle.floating;
      case 'image':
        return ElegantNavBarStyle.image;
      default:
        return ElegantNavBarStyle.floating;
    }
  }

  static Future<void> setElegantStyle(ElegantNavBarStyle style) async {
    final prefs = await SharedPreferences.getInstance();
    final styleString = style == ElegantNavBarStyle.simple
        ? 'simple'
        : style == ElegantNavBarStyle.floating
            ? 'floating'
            : 'image';
    await prefs.setString(_elegantStyleKey, styleString);
  }

  static Future<StylishNavBarStyle> getStylishStyle() async {
    final prefs = await SharedPreferences.getInstance();
    final styleString = prefs.getString(_stylishStyleKey) ?? 'style1';
    switch (styleString) {
      case 'style1':
        return StylishNavBarStyle.style1;
      case 'style2':
        return StylishNavBarStyle.style2;
      case 'style3':
        return StylishNavBarStyle.style3;
      case 'style4':
        return StylishNavBarStyle.style4;
      case 'style5':
        return StylishNavBarStyle.style5;
      case 'style6':
        return StylishNavBarStyle.style6;
      default:
        return StylishNavBarStyle.style1;
    }
  }

  static Future<void> setStylishStyle(StylishNavBarStyle style) async {
    final prefs = await SharedPreferences.getInstance();
    final styleString = 'style${style.index + 1}';
    await prefs.setString(_stylishStyleKey, styleString);
  }
}
