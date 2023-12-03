import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:therapiest_ai/global/globals.dart';

class ChatWithAI {
  getBotMessage(String messege) async {
    try {
      String url = "https://api.openai.com/v1/chat/completions";
      var urlApi = Uri.parse(url);
      var response = await http.post(urlApi,
          headers: {
            "Content-Type": "application/json",
            "Authorization": dotenv.env['BEARER']!
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": "system", "content": currentSystem},
              {"role": "user", "content": messege}
            ],
            "temperature": 0.5,
            "max_tokens": 1024,
            "top_p": 1,
            "frequency_penalty": 0,
            "presence_penalty": 0
          }));
      String utf8Encoded =
          jsonDecode(response.body)["choices"][0]["message"]["content"];
      var utf8Runs = utf8Encoded.runes.toList();
      return utf8.decode(utf8Runs);
    } catch (error) {
      print("object");
    }
  }
}
