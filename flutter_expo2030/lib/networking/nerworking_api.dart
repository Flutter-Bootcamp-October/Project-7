import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  final url = "";
  Future<String> connectGpt({required String msg}) async {
    var urlApi = Uri.parse(url);
    try {
      var response = await http.post(urlApi,
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                ""
          },
          body: json.encode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    "You will be provided with a Question about Riyadh Expo, and your task is to  provide information about Riyadh Expo."
              },
              {"role": "user", "content": msg}
            ],
            "temperature": 0,
            "max_tokens": 1024,
            "top_p": 1,
            "frequency_penalty": 0,
            "presence_penalty": 0
          }));
      print("Respone body :${response.body}");
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        return body["choices"][0]["message"]["content"];
      } else {
        return "No data${response.body}";
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}
