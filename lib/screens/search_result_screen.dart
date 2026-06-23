import 'package:flutter/material.dart';
import '../models/word_model.dart';
import '../services/api_service.dart';
import '../services/favorites_service.dart';
import '../services/history_service.dart';
import '../services/tts_service.dart';
import '../services/genz_service.dart';
import '../widgets/word_card.dart';
import '../services/xp_service.dart';

class SearchResultScreen extends StatelessWidget {
  final String word;

  const SearchResultScreen({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    HistoryService.addHistory(word);
    XpService.addXp(10);

    return Scaffold(
      appBar: AppBar(
        title: Text(word),
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              TtsService.speak(word);
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () async {
              await FavoritesService.addFavorite(word);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Added to Favorites ❤️"),
                ),
              );
            },
          ),
        ],
      ),

      body: FutureBuilder<WordModel?>(
        future: ApiService.getWord(word),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                "Word not found",
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          final data = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    data.word,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  WordCard(
                    title: "📚 Part of Speech",
                    content: data.partOfSpeech,
                  ),

                  WordCard(
                    title: "💡 Meaning",
                    content: data.meaning,
                  ),

                  WordCard(
                    title: "📝 Example",
                    content: data.example,
                  ),

                  WordCard(
                    title: "😎 Gen-Z Meaning",
                    content: GenZService.getMeaning(data.word),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}