// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blitz/pages/login_reg/login_page.dart';
import 'package:blitz/pages/login_reg/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PromptPage extends StatelessWidget {
  const PromptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              //logo
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child:
                          SvgPicture.asset('assets/blitzlogo.svg', width: 150),
                    ),
                    Text(
                      "BLITZ",
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  ],
                ),
              ),

              //buttons

              //login button

              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterationPage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset.zero,
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text("Register",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ),
                  ),

                  //register Button
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
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
                          "Login",
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
