import 'package:aiquizapp/controller/quiz_controller.dart';
import 'package:aiquizapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends StatelessWidget {
  List<String> answers = ["Paris", "Berlin", "Dublin", "Dehli"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "7",
                                      style: myStyle(
                                          18, Colors.green, FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "8",
                                      style: myStyle(
                                          18, Colors.red, FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.close_rounded,
                                      color: Colors.red,
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Question 1/20',
                              style: myStyle(20, Colors.black, FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'What is the capital of France?',
                              style: myStyle(20, Colors.black, FontWeight.w600),
                            ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: answers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index != 0
                                ? EdgeInsets.only(top: 20.0)
                                : EdgeInsets.only(top: 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.35),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  answers[index],
                                  style: myStyle(
                                      20, Colors.black, FontWeight.w600),
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.16),
                child: SizedBox(
                  height: 55,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: CircularProgressIndicator(
                            value: 0.5,
                            strokeWidth: 5.0,
                            backgroundColor: Colors.white,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(blueColor),
                          ),
                        ),
                      ),
                      Center(
                          child: Text(
                        "18",
                        style: myStyle(20, blueColor, FontWeight.w600),
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
