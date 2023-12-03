import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiNetorkingg {
  final url = "https://api.openai.com/v1/chat/completions";

  final String authorization = "";
  Future<String> grammarCorrection({required String msg}) async {
    var urlApi = Uri.parse(url);
    try {
      var respnse = await http.post(urlApi,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "authorization"
            /*"Bearer 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"*/
          },
          body: json.encode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    "You will be provided with statements, and your task is to convert them to standard English."
              },
              {"role": "user", "content": msg},
              {"role": "assistant", "content": msg}
            ],
            "temperature": 0,
            "max_tokens": 256,
            "top_p": 1,
            "frequency_penalty": 0,
            "presence_penalty": 0
          }));
      //print("response statusCode: ${respnse.statusCode}");
      // print("response body: ${respnse.body}");
      if (respnse.statusCode == 200) {
        final body = jsonDecode(respnse.body);
        return body["choices"][0]["message"]["content"];
      } else {
        return "No data ${respnse.body}";
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}
