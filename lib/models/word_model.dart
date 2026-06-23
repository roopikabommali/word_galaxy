class WordModel {
  final String word;
  final String meaning;
  final String example;
  final String partOfSpeech;

  WordModel({
    required this.word,
    required this.meaning,
    required this.example,
    required this.partOfSpeech,
  });

  factory WordModel.fromJson(dynamic json) {

    String example = "";

    // Search for an example in all definitions
    for (var meaning in json[0]['meanings']) {
      for (var definition in meaning['definitions']) {

        if (definition['example'] != null) {
          example = definition['example'];
          break;
        }
      }

      if (example.isNotEmpty) {
        break;
      }
    }

    // Generate one if none exists
    if (example.isEmpty) {
      example =
          "Example sentence for '${json[0]['word']}': This word is commonly used in everyday conversations.";
    }

    return WordModel(
      word: json[0]['word'],
      meaning: json[0]['meanings'][0]['definitions'][0]['definition'],
      example: example,
      partOfSpeech: json[0]['meanings'][0]['partOfSpeech'],
    );
  }
}