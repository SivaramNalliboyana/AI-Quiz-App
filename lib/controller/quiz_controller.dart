import 'package:aiquizapp/models/quiz_question_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizProvider =
    StateProvider.autoDispose((ref) => QuizState(selectedOption: ""));

class QuizState {
  final List<QuizQuestion> quizQuestions;
  final int currentQuestionIndex;
  final String selectedOption;
  final int score;

  QuizState({
    this.quizQuestions = const [],
    this.currentQuestionIndex = 0,
    required this.selectedOption,
    this.score = 0,
  });

  QuizQuestion get currentQuestion => quizQuestions[currentQuestionIndex];

  QuizState copyWith({
    required List<QuizQuestion> quizQuestions,
    required int currentQuestionIndex,
    required String selectedOption,
    required int score,
  }) {
    return QuizState(
      quizQuestions: quizQuestions ?? this.quizQuestions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedOption: selectedOption ?? this.selectedOption,
      score: score ?? this.score,
    );
  }
}
