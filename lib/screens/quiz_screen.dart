import 'dart:math';
import 'package:flutter/material.dart';
import '../services/xp_service.dart';
import 'score_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  final List<Map<String, dynamic>> allQuestions = [
    {
      "question": "What does 'Happy' mean?",
      "options": ["Sad", "Angry", "Feeling pleasure", "Tired"],
      "answer": 2,
    },
    {
      "question": "What does 'Galaxy' mean?",
      "options": ["Planet", "Group of stars", "Car", "Ocean"],
      "answer": 1,
    },
    {
      "question": "What does 'Friend' mean?",
      "options": ["Enemy", "Companion", "Teacher", "Robot"],
      "answer": 1,
    },
    {
      "question": "What does 'Technology' mean?",
      "options": ["Food", "Science tools", "Animal", "Tree"],
      "answer": 1,
    },
    {
      "question": "What does 'Success' mean?",
      "options": ["Failure", "Achievement", "Sleep", "Rain"],
      "answer": 1,
    },
    {
      "question": "What does 'Brave' mean?",
      "options": ["Cowardly", "Fearful", "Courageous", "Lazy"],
      "answer": 2,
    },
    {
      "question": "What does 'Ancient' mean?",
      "options": ["Modern", "Very old", "Small", "Fast"],
      "answer": 1,
    },
    {
      "question": "What does 'Curious' mean?",
      "options": ["Interested to learn", "Angry", "Lazy", "Silent"],
      "answer": 0,
    },
    {
      "question": "What does 'Journey' mean?",
      "options": ["Travel", "Sleep", "Study", "Fight"],
      "answer": 0,
    },
    {
      "question": "What does 'Wisdom' mean?",
      "options": ["Knowledge", "Weakness", "Fear", "Noise"],
      "answer": 0,
    },
    {
      "question": "What does 'Creative' mean?",
      "options": ["Inventive", "Boring", "Slow", "Old"],
      "answer": 0,
    },
    {
      "question": "What does 'Explore' mean?",
      "options": ["Discover", "Hide", "Forget", "Sleep"],
      "answer": 0,
    },
    {
      "question": "What does 'Victory' mean?",
      "options": ["Loss", "Success", "Rain", "Silence"],
      "answer": 1,
    },
    {
      "question": "What does 'Future' mean?",
      "options": ["Past", "Present", "Coming time", "Memory"],
      "answer": 2,
    },
    {
      "question": "What does 'Energy' mean?",
      "options": ["Power", "Sadness", "Fear", "Weakness"],
      "answer": 0,
    },
  ];

  late List<Map<String, dynamic>> questions;

  @override
  void initState() {
    super.initState();

    questions = List.from(allQuestions);
    questions.shuffle(Random());
    questions = questions.take(5).toList();
  }

  void checkAnswer(int index) async {
    if (index == questions[currentQuestion]["answer"]) {
      score++;

      // Add XP for correct answer
      await XpService.addXp(10);
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ScoreScreen(
            score: score,
            total: questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text("🎮 Word Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Question ${currentQuestion + 1}/5",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              q["question"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ...(q["options"] as List<String>).map(
              (option) => Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(
                      q["options"].indexOf(option),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}