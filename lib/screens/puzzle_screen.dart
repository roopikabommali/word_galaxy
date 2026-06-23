import 'dart:math';
import 'package:flutter/material.dart';
import '../services/xp_service.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  int score = 0;

  final List<Map<String, String>> puzzles = [
    {
      "word": "HAPPY",
      "scrambled": "YPPAH",
    },
    {
      "word": "GALAXY",
      "scrambled": "LAXYGA",
    },
    {
      "word": "FRIEND",
      "scrambled": "NDFRIE",
    },
    {
      "word": "SUCCESS",
      "scrambled": "CESSSUC",
    },
    {
      "word": "FUTURE",
      "scrambled": "TUREFU",
    },
  ];

  late Map<String, String> currentPuzzle;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPuzzle();
  }

  void loadPuzzle() {
    currentPuzzle = puzzles[Random().nextInt(puzzles.length)];
  }

  Future<void> checkAnswer() async {
    if (controller.text.trim().toUpperCase() ==
        currentPuzzle["word"]) {
      score++;

      await XpService.addXp(20);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Correct! +20 XP 🎉"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Wrong! Answer: ${currentPuzzle["word"]}",
          ),
        ),
      );
    }

    controller.clear();

    setState(() {
      loadPuzzle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🧩 Word Puzzle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 30),

            Text(
              "Score: $score",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Unscramble The Word",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              currentPuzzle["scrambled"]!,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter correct word",
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: checkAnswer,
                child: const Text(
                  "Submit",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}