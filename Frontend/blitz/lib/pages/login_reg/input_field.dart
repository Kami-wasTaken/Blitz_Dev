// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            const BoxShadow(
              color: Color.fromRGBO(166, 166, 166, 0.25),
            ),
            const BoxShadow(
              color: Colors.white,
              spreadRadius: -1.0,
              blurRadius: 12.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
              border: InputBorder.none,
            ),
            cursorColor: Colors.black87,
            cursorHeight: 20,
            cursorWidth: 2,
            cursorRadius: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
