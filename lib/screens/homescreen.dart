import 'package:aiquizapp/screens/quizscreen.dart';
import 'package:aiquizapp/utils/style.dart';
import 'package:aiquizapp/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              color: blueColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Create Quiz',
                    style: myStyle(28, Colors.white, FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          style: myStyle(16, Colors.grey, FontWeight.bold),
                          decoration: InputDecoration(
                            labelText: 'Enter a custom topic',
                            labelStyle:
                                myStyle(16, Colors.grey, FontWeight.w400),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizScreen())),
                      child: Text(
                        'Create',
                        style: myStyle(20, blueColor, FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 8.0,
                runSpacing: 8.0,
                children: quizTopics.map((topic) {
                  return Chip(
                    label: Text(
                      topic['topic'],
                      style: myStyle(16, Colors.white, FontWeight.w700),
                    ),
                    side: BorderSide.none,
                    backgroundColor: blueColor,
                    elevation: 4,
                    avatar: Text(
                      topic['emoji'],
                      style: TextStyle(fontSize: 20.0),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
