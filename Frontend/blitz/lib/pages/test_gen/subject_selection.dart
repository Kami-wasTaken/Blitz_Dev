// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:blitz/pages/test_gen/subject.dart';
import 'package:flutter/material.dart';

class SubjectSelection extends StatefulWidget {
  const SubjectSelection({super.key});

  @override
  State<SubjectSelection> createState() => _SubjectSelectionState();
}

class _SubjectSelectionState extends State<SubjectSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_rounded, size: 30),
                  ),
                  Text("Subjects",
                      style: Theme.of(context).textTheme.displaySmall),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.logout_rounded, size: 30))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  children: [
                    Subject(
                      subjectTitle: "Math",
                      subjectColor: Theme.of(context).hintColor,
                    ),
                    Subject(
                        subjectTitle: "Chemistry",
                        subjectColor: const Color.fromRGBO(220, 235, 220, 1)),
                    Subject(
                      subjectTitle: "Physics",
                      subjectColor: const Color.fromRGBO(251, 232, 196, 1),
                    ),
                    Subject(
                      subjectTitle: "Spanish",
                      subjectColor: const Color.fromRGBO(230, 219, 240, 1),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset.zero,
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ]),
                    child: Center(
                        child: Text(
                      "Continue",
                      style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.bodyLarge?.fontFamily,
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge?.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.bodyLarge?.fontWeight,
                          color: Colors.grey.shade50),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
