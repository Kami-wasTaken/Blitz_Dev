// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, avoid_function_literals_in_foreach_calls

import 'package:blitz/pages/dashboard/dashboard.dart';
import 'package:blitz/pages/login_reg/common_functions.dart';
import 'package:blitz/pages/login_reg/input_field.dart';
import 'package:blitz/pages/login_reg/otp_sheet.dart';
import 'package:blitz/pages/login_reg/phone_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  Future displayModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => OTPSheet(
              verificationID: requiredID,
              phoneNumber: _phoneController.text.trim(),
              username: _usernameController.text.trim(),
              school: _schoolController.text.trim(),
              grade: _classController.text.trim(),
              board: _boardController.text.trim(),
              isRegister: true,
            ));
  }

  // validation on inputs complete - todo
  // ensure there is one entry in users in the database
  // button animation
  // error styling

  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _schoolController = TextEditingController();
  final _classController = TextEditingController();
  final _boardController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String requiredID = '';
  String inputError = '';

  String countryCode = '+91';
  String countryName = 'IN';

  void changeCountry(Country country) {
    print(country.phoneCode);
    countryCode = ("+${country.phoneCode}");
    countryName = country.countryCode;
    setState(() {});
  }

  var firestoreInstance = FirebaseFirestore.instance;

  signUpWithNumber() async {
    UserCredential credential;
    User user;
    if (await userExists(_usernameController.text.trim(), firestoreInstance)) {
      inputError = "Username already exists";
      setState(() {});
    } else if (await phoneExists(
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
  void initState() {
    super.initState();
  }

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
                        PhoneInput(
                            controller: _phoneController,
                            countryCode: countryCode,
                            countryName: countryName,
                            countryChange: changeCountry),
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
                        SizedBox(
                          child: Center(child: Text(inputError)),
                          height: 75.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            signUpWithNumber();
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
