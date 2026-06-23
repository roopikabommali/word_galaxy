import 'package:flutter/material.dart';
import '../services/favorites_service.dart';
import 'search_result_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    favorites = await FavoritesService.getFavorites();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("❤️ Favorites"),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text("No favorite words yet"),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.favorite),
                  title: Text(favorites[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SearchResultScreen(
                          word: favorites[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}