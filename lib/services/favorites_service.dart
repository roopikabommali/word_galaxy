import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String key = "favorites";

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<void> addFavorite(String word) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> favorites = prefs.getStringList(key) ?? [];

    if (!favorites.contains(word)) {
      favorites.add(word);
    }

    await prefs.setStringList(key, favorites);
  }

  static Future<void> removeFavorite(String word) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> favorites = prefs.getStringList(key) ?? [];

    favorites.remove(word);

    await prefs.setStringList(key, favorites);
  }

  static Future<bool> isFavorite(String word) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> favorites = prefs.getStringList(key) ?? [];

    return favorites.contains(word);
  }
}