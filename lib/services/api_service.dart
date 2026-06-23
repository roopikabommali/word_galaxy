import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/word_model.dart';

class ApiService {
  static Future<WordModel?> getWord(String word) async {
    final url = Uri.parse(
      "https://api.dictionaryapi.dev/api/v2/entries/en/$word",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return WordModel.fromJson(
        jsonDecode(response.body),
      );
    }

    return null;
  }
}