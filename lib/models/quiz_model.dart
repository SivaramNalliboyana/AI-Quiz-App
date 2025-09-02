class QuizModel {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  QuizModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answers': answers,
      'correctAnswer': correctAnswer
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] ?? '',
      answers: List<String>.from(map['answers']),
      correctAnswer: map['correctAnswer'] ?? '',
    );
  }
}
