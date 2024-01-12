// ignore_for_file: prefer_const_constructors

import 'package:blitz/pages/test_gen/test_options.dart';
import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  const Subject(
      {super.key, required this.subjectTitle, required this.subjectColor});

  final String subjectTitle;
  final Color subjectColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          alignment: Alignment.bottomLeft,
          height: 120,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset.zero,
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
            color: subjectColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              subjectTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    );
  }
}
