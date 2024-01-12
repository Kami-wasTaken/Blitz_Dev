// ignore_for_file: prefer_const_constructors

import 'package:blitz/pages/test_gen/topics.dart';
import 'package:flutter/material.dart';

class TestOptions extends StatefulWidget {
  const TestOptions({super.key});

  @override
  State<TestOptions> createState() => _TestOptionsState();
}

class _TestOptionsState extends State<TestOptions> {
  double testDifficulty = 0;
  String testDifficultyStr = 'Easy';
  double questionsCount = 0;
  List<String> topics = [
    'Trigonometry',
    'Binomial Theorum',
    'polynomial',
    'Geometry',
    'Integration',
    'Quadratic Functions',
    'Functions'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_rounded, size: 30),
                  ),
                  Text("Options",
                      style: Theme.of(context).textTheme.displaySmall),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.logout_rounded, size: 30))
                ],
              ),
              //Test Difficulty
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset.zero,
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                height: 190,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Test Difficulty",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600]),
                          ),
                          Text(
                            testDifficultyStr,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SliderTheme(
                        data: const SliderThemeData(
                          trackHeight: 5,
                          thumbShape: RoundSliderThumbShape(elevation: 0),
                        ),
                        child: Slider(
                          value: testDifficulty,
                          min: 0,
                          max: 2,
                          divisions: 2,
                          activeColor: Theme.of(context).hintColor,
                          inactiveColor: Colors.grey[200],
                          onChanged: (value) {
                            setState(() {
                              testDifficulty = value;
                              switch (testDifficulty) {
                                case 0:
                                  testDifficultyStr = 'Easy';
                                  break;
                                case 1:
                                  testDifficultyStr = 'Medium';
                                case 2:
                                  testDifficultyStr = 'Hard';
                              }
                            });
                          },
                        ),
                      ),
                    )
                  ]),
                ),
              ),

              //Topics Selection
              Topics(
                topicsList: topics,
              ),

              //Number of questions
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset.zero,
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                height: 190,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of Questions",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600]),
                          ),
                          Text(
                            questionsCount.toInt().toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SliderTheme(
                        data: const SliderThemeData(
                          trackHeight: 5,
                          thumbShape: RoundSliderThumbShape(elevation: 0),
                        ),
                        child: Slider(
                          value: questionsCount,
                          min: 0,
                          max: 50,
                          divisions: 50,
                          activeColor: Theme.of(context).hintColor,
                          inactiveColor: Colors.grey[200],
                          onChanged: (value) {
                            setState(() {
                              questionsCount = value;
                            });
                          },
                        ),
                      ),
                    )
                  ]),
                ),
              ),

              //Continue Button
              GestureDetector(
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
            ],
          ),
        ),
      ),
    );
  }
}
