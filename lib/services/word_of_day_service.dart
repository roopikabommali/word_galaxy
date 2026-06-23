class WordOfDayService {
  static final List<String> words = [
    "galaxy",
    "success",
    "technology",
    "dream",
    "innovation",
    "future",
    "knowledge",
    "explore",
    "friend",
    "happy",
  ];

  static String getWordOfDay() {
    final day = DateTime.now().day;
    return words[day % words.length];
  }
}