import 'package:shared_preferences/shared_preferences.dart';

class XpService {
  static const String xpKey = "xp";

  static Future<int> getXp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(xpKey) ?? 0;
  }

  static Future<void> addXp(int points) async {
    final prefs = await SharedPreferences.getInstance();

    int currentXp = prefs.getInt(xpKey) ?? 0;

    currentXp += points;

    await prefs.setInt(xpKey, currentXp);
  }

  static int getLevel(int xp) {
    return (xp ~/ 100) + 1;
  }
}