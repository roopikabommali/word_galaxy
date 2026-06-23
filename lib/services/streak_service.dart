import 'package:shared_preferences/shared_preferences.dart';

class StreakService {
  static const String streakKey = "streak";
  static const String lastOpenKey = "last_open";

  static Future<void> updateStreak() async {
    final prefs = await SharedPreferences.getInstance();

    final today = DateTime.now();
    final todayString =
        "${today.year}-${today.month}-${today.day}";

    final lastOpen = prefs.getString(lastOpenKey);

    int streak = prefs.getInt(streakKey) ?? 0;

    if (lastOpen == null) {
      streak = 1;
    } else {
      final lastDate = DateTime.parse(lastOpen);

      final difference =
          today.difference(lastDate).inDays;

      if (difference == 1) {
        streak++;
      } else if (difference > 1) {
        streak = 1;
      }
    }

    await prefs.setInt(streakKey, streak);
    await prefs.setString(lastOpenKey, todayString);
  }

  static Future<int> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(streakKey) ?? 1;
  }
}