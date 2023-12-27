// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:blitz/pages/login_reg/input_field.dart';
import 'package:blitz/pages/login_reg/otp_sheet.dart';
import 'package:flutter/material.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  Future displayModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context, builder: (context) => Container());
  }

  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _schoolController = TextEditingController();
  final _classController = TextEditingController();
  final _boardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // back button
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_rounded),
              iconSize: 30,
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  //title
                  Text("Register",
                      style: Theme.of(context).textTheme.displayLarge),

                  //form

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Form(
                        child: Column(
                      children: [
                        InputField(
                          hintText: 'Username',
                          controller: _usernameController,
                        ),
                        InputField(
                          hintText: 'Phone Number',
                          controller: _phoneController,
                        ),
                        InputField(
                          hintText: 'School',
                          controller: _schoolController,
                        ),
                        InputField(
                          hintText: 'Class',
                          controller: _classController,
                        ),
                        InputField(
                          hintText: 'Board of Education',
                          controller: _boardController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 75.0),
                          child: GestureDetector(
                            onTap: () {
                              displayModalBottomSheet(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 65,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset.zero,
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ]),
                              child: Center(
                                  child: Text(
                                "Continue",
                                style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontFamily,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight,
                                    color: Colors.grey.shade50),
                              )),
                            ),
                          ),
                        ),
                      ],
                    )),
                  )

                  // register button
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
