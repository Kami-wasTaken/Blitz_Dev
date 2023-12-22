// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
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

                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.grey)),
                        cursorColor: Colors.black87,
                        cursorHeight: 30,
                        cursorWidth: 2,
                        cursorRadius: Radius.circular(20),
                      ),
                    ],
                  ))

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
