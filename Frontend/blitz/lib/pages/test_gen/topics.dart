// ignore_for_file: prefer_const_constructors

import 'package:blitz/pages/test_gen/topic_sheet.dart';
import 'package:flutter/material.dart';

class Topics extends StatelessWidget {
  Topics({super.key, required this.topicsList});

  final List<String> topicsList;
  List<String> topicsSelected = [];

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
            padding: const EdgeInsets.all(20.0),
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
        ]),
      ),
    );
  }
}
