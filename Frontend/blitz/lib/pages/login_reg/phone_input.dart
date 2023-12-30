// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneInput extends StatelessWidget {
  PhoneInput(
      {super.key,
      required this.controller,
      required this.countryCode,
      required this.countryName,
      required this.countryChange});

  final TextEditingController controller;

  final String countryCode;
  final String countryName;
  final Function(Country) countryChange;

  Future displayModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Text("hello")));
  }

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
            child: Row(
              children: [
                IconButton(
                    padding: EdgeInsets.only(top: 2),
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: countryChange,
                        countryListTheme: CountryListThemeData(
                            // Optional. Sets the border radius for the bottomsheet.
                            borderRadius: BorderRadius.circular(20),
                            bottomSheetHeight: 400,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            searchTextStyle:
                                Theme.of(context).textTheme.bodyMedium,
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            inputDecoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                focusColor: Colors.black,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontFamily,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontSize),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      );
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                      color: Colors.grey,
                    )),
                Text("${countryName} ${countryCode}"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                      width: 150,
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        controller: controller,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontFamily,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontSize),
                          border: InputBorder.none,
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
