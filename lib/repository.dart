import 'dart:convert';
import 'package:http/http.dart' as http;

class Repository {
  static Future<String> getJoke() async {
    final response = await http.get(Uri.parse(
        'https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=single'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['joke'];
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
