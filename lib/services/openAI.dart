import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAI {

  Future<String> generateResponse(String userPrompt) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer _apiKey',
      //cannot use real API key here because of security issues with github
    };
    final body = jsonEncode({
      'model': 'gpt-4o-mini',
      'store': true,
      'messages': [
        {'role': 'user', 'content': userPrompt},
      ],
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return 'Error: ${response.body}';
      }
    } catch (e) {
      return 'Exception: $e';
    }
  }
}
