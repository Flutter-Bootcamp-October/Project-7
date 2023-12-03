import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiNetworking {
  final uri = 'https://api.openai.com/v1/chat/completions';

  Future<String> connectionGPT({required String courseName}) async {
    var urlAPI = Uri.parse(uri);
    try {
      var response = await http.post(urlAPI,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer "
          },
          body: json.encode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    "you will be provide with course name and you will return only 4 paths and small description for each path but i need it numeric list"
              },
              {"role": "user", "content": courseName},
            ],
            "temperature": 0,
            "max_tokens": 256,
            "top_p": 1,
            "frequency_penalty": 0,
            "presence_penalty": 0
          }));

      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final content = body['choices'][0]['message']['content'];
        //print(body['choices'][0]['message']['content']);
        //print(content);
        return content;
      } else {
        return 'No Data ${response.body}';
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}
