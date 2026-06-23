import 'package:flutter/material.dart';
import '../services/xp_service.dart';
import '../services/badge_service.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int xp = 0;
  int level = 1;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    xp = await XpService.getXp();
    level = XpService.getLevel(xp);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final badges = BadgeService.getBadges(xp);

    double progress = (xp % 100) / 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text("📊 Progress Dashboard"),
      ),
      body: Padding(
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
                      "⭐ XP: $xp",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "🚀 Level: $level",
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 20),

                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 12,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "${xp % 100}/100 XP to next level",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "🏅 Unlocked Badges",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: badges.isEmpty
                  ? const Center(
                      child: Text(
                        "No badges unlocked yet",
                      ),
                    )
                  : ListView.builder(
                      itemCount: badges.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.workspace_premium),
                            title: Text(badges[index]),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}