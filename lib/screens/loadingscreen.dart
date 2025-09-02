import 'package:aiquizapp/utils/style.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Making your quiz..",
              style: myStyle(20, Colors.black, FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
