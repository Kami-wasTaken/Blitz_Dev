// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:ffi';

import 'package:blitz/pages/dashboard/dashboard.dart';
import 'package:blitz/pages/login_reg/prompt_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPSheet extends StatelessWidget {
  OTPSheet({
    super.key,
    required this.verificationID,
    this.username,
    this.phoneNumber,
    this.school,
    this.grade,
    this.board,
    required this.isRegister,
  });

  TextEditingController controller = TextEditingController();
  final String verificationID;
  final String? username;
  final String? phoneNumber;
  final String? school;
  final String? grade;
  final String? board;
  final bool isRegister;

  Future addUserDetails(String username, String phoneNumber, String school,
      String grade, String board) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'Username': username,
      "PhoneNumber": phoneNumber,
      "School": school,
      "Class": grade,
      "Board": board,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter OTP",
                  style: Theme.of(context).textTheme.displaySmall),
              Text("We've sent an OTP to your phone. It will expire in 30s."),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: PinCodeTextField(
                  controller: controller,
                  appContext: context,
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                  length: 6,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(15),
                    fieldHeight: 70,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black,
                    selectedColor: Colors.black,
                    selectedBorderWidth: 0.5,
                    activeBorderWidth: 0.25,
                    inactiveBorderWidth: 0.25,
                  ),
                  onCompleted: (v) {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    PhoneAuthCredential _credential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationID,
                            smsCode: controller.text.trim());
                    auth.signInWithCredential(_credential).then((result) {
                      if (isRegister) {
                        addUserDetails(
                            username!, phoneNumber!, school!, grade!, board!);
                      }
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()))
                          .catchError((e) {
                        print(e);
                      });
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
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
                            color: Colors.grey.shade200,
                            offset: Offset.zero,
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ]),
                    child: Center(
                        child: Text(
                      "Send Again",
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
        height: 375,
        width: MediaQuery.of(context).size.width);
  }
}
