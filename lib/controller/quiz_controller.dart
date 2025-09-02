import 'dart:async';

import 'package:aiquizapp/models/quiz_model.dart';
import 'package:aiquizapp/repositories/quiz_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizProvider = FutureProvider.family.autoDispose<List<QuizModel>, String>(
    (ref, String topic) => QuizRepository().getQuestions(topic));

final currentQuestionIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
final selectedOptionProvider = StateProvider.autoDispose<String>((ref) => '');
final correctAnswersProvider = StateProvider.autoDispose<int>((ref) => 0);
final wrongAnswersProvider = StateProvider.autoDispose<int>((ref) => 0);
