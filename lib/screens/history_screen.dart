import 'package:flutter/material.dart';
import '../services/history_service.dart';
import 'search_result_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> history = [];

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future<void> loadHistory() async {
    history = await HistoryService.getHistory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🕒 Search History"),
      ),
      body: history.isEmpty
          ? const Center(
              child: Text(
                "No history yet",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(history[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SearchResultScreen(
                          word: history[index],
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