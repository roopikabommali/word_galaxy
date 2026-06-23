import 'package:flutter/material.dart';
import '../widgets/search_box.dart';
import '../services/word_of_day_service.dart';
import '../services/xp_service.dart';
import '../services/streak_service.dart';
import '../services/badge_service.dart';

import 'search_result_screen.dart';
import 'favorites_screen.dart';
import 'history_screen.dart';
import 'quiz_screen.dart';
import 'progress_screen.dart';
import 'puzzle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  int xp = 0;
  int level = 1;
  int streak = 1;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await StreakService.updateStreak();

    xp = await XpService.getXp();
    level = XpService.getLevel(xp);
    streak = await StreakService.getStreak();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final wordOfDay = WordOfDayService.getWordOfDay();
    final badges = BadgeService.getBadges(xp);

    return Scaffold(
      appBar: AppBar(
        title: const Text("🌌 WordGalaxy"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProgressScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoryScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "⭐ XP : $xp",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "🚀 Level : $level",
                        style: const TextStyle(fontSize: 20),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "🔥 Daily Streak : $streak Days",
                        style: const TextStyle(fontSize: 20),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "🏅 Achievements",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      if (badges.isEmpty)
                        const Text("No badges unlocked yet")
                      else
                        ...badges.map(
                          (badge) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              badge,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Discover Words Across The Galaxy ✨",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchResultScreen(
                        word: wordOfDay,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          "🌟 Word Of The Day",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          wordOfDay,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Tap to explore this word",
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const QuizScreen(),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: const [
                        Text(
                          "🎮 Word Quiz",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Test your vocabulary skills!",
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PuzzleScreen(),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: const [
                        Text(
                          "🧩 Word Puzzle",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Unscramble words and earn XP!",
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              SearchBox(
                controller: controller,
                onPressed: () {
                  if (controller.text.trim().isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SearchResultScreen(
                          word: controller.text.trim(),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}