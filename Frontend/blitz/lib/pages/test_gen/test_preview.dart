// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TestPreview extends StatelessWidget {
  const TestPreview(
      {super.key,
      required this.testName,
      required this.testDifficulty,
      required this.testQuestionsCount});
  final String testName;
  final String testDifficulty;
  final String testQuestionsCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 30,
                  )),
              Text(testName),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Test Difficulty"),
                  Text(testDifficulty),
                ],
              ),
              Column(
                children: [
                  Text("Topics"),
                  Text(""),
                ],
              ),
              Column(
                children: [
                  Text("Number of questions"),
                  Text(testQuestionsCount),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
