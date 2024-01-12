// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_brace_in_string_interps

import 'package:blitz/pages/dashboard/dashboard.dart';
import 'package:blitz/pages/login_reg/common_functions.dart';
import 'package:blitz/pages/login_reg/otp_sheet.dart';
import 'package:blitz/pages/login_reg/phone_input.dart';
import 'package:blitz/pages/login_reg/prompt_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future displayModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => OTPSheet(
        verificationID: requiredID,
        isRegister: false,
      ),
    );
  }

  String countryCode = '+91';

  String countryName = 'IN';
  final firestoreInstance = FirebaseFirestore.instance;

  void changeCountry(Country country) {
    print(country.phoneCode);
    countryCode = ("+${country.phoneCode}");
    countryName = country.countryCode;
    setState(() {});
  }

  final _phoneController = TextEditingController();
  String requiredID = '';
  String inputError = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  // ignore: prefer_final_fields

  signInWithNumber() async {
    if (await phoneExists(
        ("$countryCode${_phoneController.text.trim()}"), firestoreInstance)) {
      inputError = "Phone number already exists";
      setState(() {});
    } else {
      try {
        await auth.verifyPhoneNumber(
            phoneNumber: ("$countryCode${_phoneController.text.trim()}"),
            verificationCompleted: (PhoneAuthCredential authCredential) async {
              await auth.signInWithCredential(authCredential).then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              });
            },
            verificationFailed: ((e) {
              print(e.message);
              print(_phoneController.text.trim());
            }),
            codeSent: (String verificationID, [int? forceResendingToken]) {
              requiredID = verificationID;
              print(_phoneController.text.trim());
              setState(() {});
              displayModalBottomSheet(context);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              verificationId = verificationId;
            },
            timeout: Duration(seconds: 30));
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Form(
                          child: Column(
                        children: [
                          PhoneInput(
                            controller: _phoneController,
                            countryCode: countryCode,
                            countryName: countryName,
                            countryChange: (country) => changeCountry(country),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                signInWithNumber();
                              },
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
                          SizedBox(
                            height: 75,
                            child: Center(
                              child: Text(inputError),
                            ),
                          )
                        ],
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
