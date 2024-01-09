// ignore_for_file: prefer_const_constructors

import 'package:blitz/pages/dashboard/barchart/progress_chart.dart';
import 'package:blitz/pages/dashboard/choice_button.dart';
import 'package:blitz/pages/dashboard/recent_test.dart';
import 'package:blitz/pages/test_gen/subject_selection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dashboard",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  IconButton(
                      onPressed: () {
                        //Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.logout_rounded,
                        size: 35,
                      ))
                ],
              ),
            ),

            //Barchart
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ProgressChart(),
            ),

            // Recent Tests
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text("Recent Tests",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            RecentTest(
              testName: "Math 1",
              testDate: "02/02/23",
              testDifficulty: "Hard",
            ),
            RecentTest(
              testName: "Math 2",
              testDate: "02/02/23",
              testDifficulty: "Medium",
            ),

            // Nav Buttons

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceButton(
                    buttonTitle: "Take Test",
                    buttonDes: "Practice your skills",
                    buttonColor: Theme.of(context).hintColor,
                    navigationTarget: SubjectSelection(),
                  ),
                  ChoiceButton(
                      buttonTitle: "History",
                      buttonDes: "Review your tests",
                      buttonColor: Color.fromARGB(255, 255, 237, 172),
                      navigationTarget: SubjectSelection()),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
