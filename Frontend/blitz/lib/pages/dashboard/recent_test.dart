// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class RecentTest extends StatelessWidget {
  const RecentTest(
      {super.key,
      required this.testName,
      required this.testDifficulty,
      required this.testDate});

  final String testName;
  final String testDifficulty;
  final String testDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: Offset.zero,
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    testDifficulty,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize:
                            Theme.of(context).textTheme.bodySmall?.fontSize),
                  ),
                ],
              ),
              Text(testDate,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
