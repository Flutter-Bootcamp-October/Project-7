import 'dart:convert';
import 'package:http/http.dart' as http;

final openaiApiKey = "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";

class DallEClient {
  final String apiKey;
  final http.Client client;
  final String apiUrl = 'https://api.openai.com/v1/chat/completions';

  DallEClient(this.apiKey) : client = http.Client();

  Future<String> chatbot(String prompt) async {
    if (prompt.isEmpty) {
      throw Exception('Prompt is empty. You must provide a prompt.');
    }

    try {
      var response = await client.post(Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $apiKey',
          },
          body: jsonEncode(<String, dynamic>{
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    "you will make a cinario and you will play the victimes roles then  Welcome to the investigation, Detective [User's Name]. You are about to enter a complex crime scene with four main suspects. Each suspect has a unique background and potential motive. Your task is to unravel the mystery, piece together the evidence, and identify the true culprit. As you interact with each suspect, pay close attention to their stories and alibis. To accuse someone, simply state their name and declare them the killer. Once you make an accusation, I will reveal the true solution to the puzzle. Are you ready to begin your investigation, Detective?"
              },
              {"role": "user", "content": prompt}
            ],
          }));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['choices'] != null && data['choices'].isNotEmpty) {
          return data['choices'][0]['message']['content'];
        } else {
          throw Exception('Response parsing failed');
        }
      } else {
        throw Exception('Failed to generate text: ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  void close() {
    client.close();
  }
}
