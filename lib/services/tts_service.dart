import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  static final FlutterTts flutterTts = FlutterTts();

  static Future<void> speak(String word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(word);
  }
}