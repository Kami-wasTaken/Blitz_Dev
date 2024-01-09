// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton(
      {super.key,
      required this.buttonTitle,
      required this.buttonDes,
      required this.buttonColor,
      required this.navigationTarget});

  final String buttonTitle;
  final String buttonDes;
  final Color buttonColor;
  final Widget navigationTarget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigationTarget));
      },
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: 182,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    buttonTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(buttonDes,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.fontSize)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
