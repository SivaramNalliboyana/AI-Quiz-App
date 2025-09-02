// ignore_for_file: avoid_print

import 'package:aiquizapp/controller/quiz_controller.dart';
import 'package:aiquizapp/screens/loadingscreen.dart';
import 'package:aiquizapp/screens/resultscreen.dart';
import 'package:aiquizapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _globalKey = GlobalKey<ScaffoldMessengerState>();

class QuizScreen extends ConsumerWidget {
  final String topic;
  QuizScreen(this.topic);

  late Map<String, dynamic> quizresponse;

  checkAnswer(WidgetRef ref, String correctAnswer, String selectedOption) {
    ref.read(selectedOptionProvider.notifier).state = "";
    ref.read(currentQuestionIndexProvider.notifier).state++;
    if (selectedOption == correctAnswer) {
      ref.read(correctAnswersProvider.notifier).state++;
      var snackBar = SnackBar(
        content: Text(
          'Correct',
          style: myStyle(18, Colors.white, FontWeight.bold),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.greenAccent,
      );
      _globalKey.currentState!.showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(
        content: Text(
          'Wrong',
          style: myStyle(18, Colors.white, FontWeight.bold),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      );
      _globalKey.currentState!.showSnackBar(snackBar);
      ref.read(wrongAnswersProvider.notifier).state++;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestionIndex = ref.watch(currentQuestionIndexProvider);
    final selectedOption = ref.watch(selectedOptionProvider);
    final correctAnswers = ref.watch(correctAnswersProvider);
    final wrongAnswers = ref.watch(wrongAnswersProvider);

    return ref.watch(quizProvider(topic)).when(
          data: (quizQuestions) {
            if (currentQuestionIndex < quizQuestions.length) {
              return ScaffoldMessenger(
                key: _globalKey,
                child: Scaffold(
                  backgroundColor: bgcolor,
                  floatingActionButton: Container(
                    height: 45,
                    width: 45,
                    child: FloatingActionButton(
                      backgroundColor: blueColor,
                      onPressed: () => checkAnswer(
                          ref,
                          quizQuestions[currentQuestionIndex].correctAnswer,
                          selectedOption),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: MediaQuery.of(context).size.height * 0.2),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  correctAnswers.toString(),
                                                  style: myStyle(
                                                      18,
                                                      Colors.green,
                                                      FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  wrongAnswers.toString(),
                                                  style: myStyle(18, Colors.red,
                                                      FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.close_rounded,
                                                  color: Colors.red,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Question ${currentQuestionIndex + 1}/10',
                                          style: myStyle(20, Colors.black,
                                              FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          quizQuestions[currentQuestionIndex]
                                              .question,
                                          style: myStyle(20, Colors.black,
                                              FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 20.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: quizQuestions[currentQuestionIndex]
                                    .answers
                                    .length,
                                itemBuilder: (context, index) {
                                  String answer =
                                      quizQuestions[currentQuestionIndex]
                                          .answers[index];
                                  return Padding(
                                    padding: index != 0
                                        ? const EdgeInsets.only(top: 20.0)
                                        : const EdgeInsets.only(top: 10.0),
                                    child: InkWell(
                                      onTap: () {
                                        ref
                                            .read(
                                                selectedOptionProvider.notifier)
                                            .state = answer;
                                      },
                                      child: selectedOption != answer
                                          ? Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.35),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  answer,
                                                  style: myStyle(
                                                      20,
                                                      Colors.black,
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: blueColor,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  answer,
                                                  style: myStyle(
                                                      20,
                                                      Colors.white,
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return ResultScreen(quizQuestions, correctAnswers, wrongAnswers);
            }
          },
          error: (err, trace) {
            print(err.toString());
            print(trace.toString());
            return Container();
          },
          loading: () => LoadingScreen(),
        );
  }
}
