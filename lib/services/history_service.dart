import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  static const String key = "history";

  static Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<void> addHistory(String word) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> history = prefs.getStringList(key) ?? [];

    history.remove(word);
    history.insert(0, word);

    await prefs.setStringList(key, history);
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}