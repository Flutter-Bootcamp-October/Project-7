import 'dart:convert';
import 'package:http/http.dart' as http;

class DallEClient {
  final String apiKey;
  final http.Client client;
  final String apiUrl = 'https://api.openai.com/v1/images/generations';

  DallEClient(this.apiKey) : client = http.Client();

  Future<String> generateImage(String prompt) async {
    try {
      var response = await client.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(<String, dynamic>{
          'model': 'dall-e-3',
          'prompt': prompt,
          'n': 1,
          'size': '1792x1024',
          'style': 'vivid',
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['data'] != null) {
          return data['data'][0]['url'];
        } else {
          throw Exception('Image URL not found in the response');
        }
      } else {
        print('Failed to generate image. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        throw Exception('Failed to generate image: ${response.body}');
      }
    } catch (e) {
      print('Error generating image: $e');
      throw Exception('Error generating image: $e');
    }
  }
}
