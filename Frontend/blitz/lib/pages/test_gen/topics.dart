// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blitz/pages/test_gen/topic_sheet.dart';
import 'package:flutter/material.dart';

class Topics extends StatelessWidget {
  Topics({super.key, required this.topicsList});

  final List<String> topicsList;
  List<String> topicsSelected = [
    "trignometry",
    "quadratics",
    "algebra",
    "integrals"
  ];

  Future displayModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => TopicSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Topics",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey[600]),
                ),
                IconButton(
                    onPressed: () {
                      displayModalBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.add_box_outlined,
                      size: 30,
                      color: Colors.grey[500],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                direction: Axis.horizontal,
                children: topicsSelected.map((s) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Chip(
                      label: Text(s),
                      labelStyle: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.fontFamily),
                      padding: EdgeInsets.all(6),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(40)),
                      backgroundColor: Theme.of(context).hintColor,
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
