import 'dart:convert';

import 'package:aiquizapp/models/quiz_model.dart';
import 'package:aiquizapp/utils/utils.dart';
import 'package:http/http.dart' as http;

class QuizRepository {
  Future<List<QuizModel>> getQuestions(String topic) async {
    String url = "https://api.openai.com/v1/chat/completions";

    final response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $OPENAI_KEY"
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "response_format": {"type": "json_object"},
            "messages": [
              {
                "role": "system",
                "content":
                    "You are a helpful ai which generates quiz questions and answers. Output JSON format: {questions: [{question: question content, answers: [], correctAnswer: correctanswer}]"
              },
              {
                "role": "user",
                "content":
                    "Generate 10 questions on $topic topic. Give each question with 4 answers"
              }
            ]
          },
        ));

    if (response.statusCode == 200) {
      final quizResponse = jsonDecode(response.body);
      final Map<String, dynamic> data =
          jsonDecode(quizResponse['choices'][0]['message']['content']);
      final List<QuizModel> questions = List<QuizModel>.from(
          data['questions'].map((q) => QuizModel.fromMap(q)).toList());
      print(jsonDecode(response.body));
      return questions;
    } else {
      print(jsonDecode(response.body));
      throw "error";
    }
  }
}
