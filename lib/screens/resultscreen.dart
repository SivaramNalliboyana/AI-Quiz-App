import 'package:aiquizapp/models/quiz_model.dart';
import 'package:aiquizapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultScreen extends ConsumerWidget {
  List<QuizModel> quizQuestions;
  int correctAnswers;
  int wrongAnswers;

  ResultScreen(this.quizQuestions, this.correctAnswers, this.wrongAnswers);

  String getText() {
    if (correctAnswers == 10) {
      return "Excellent";
    } else if (correctAnswers > 5 && correctAnswers < 10) {
      return "Well done";
    } else if (correctAnswers > 0 && correctAnswers < 5) {
      return "Could be better";
    } else {
      return "Try again";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: bgcolor,
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
                  top: MediaQuery.of(context).size.height * 0.15),
              child: Column(
                children: [
                  Text(
                    '${getText()} !',
                    style: myStyle(33, Colors.white, FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${((correctAnswers / 10) * 100).toInt()}% Accuracy',
                              style: myStyle(33, Colors.black, FontWeight.bold),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      correctAnswers.toString(),
                                      style: myStyle(
                                          30, Colors.green, FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 28,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      wrongAnswers.toString(),
                                      style: myStyle(
                                          30, Colors.red, FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.close_rounded,
                                      color: Colors.red,
                                      size: 28,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizQuestions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index != 0
                            ? const EdgeInsets.only(top: 20.0)
                            : const EdgeInsets.only(top: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${index + 1}) ${quizQuestions[index].question}',
                                style:
                                    myStyle(20, Colors.black, FontWeight.bold),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Text(
                                    'Correct answer:',
                                    style: myStyle(
                                        17, Colors.green, FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    quizQuestions[index].correctAnswer,
                                    style: myStyle(
                                        17, Colors.black, FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
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
    );
  }
}
