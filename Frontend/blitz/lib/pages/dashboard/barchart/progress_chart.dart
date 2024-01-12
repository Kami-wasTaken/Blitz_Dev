// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:blitz/pages/dashboard/barchart/bar_data.dart';
import 'package:blitz/pages/dashboard/barchart/chart.dart';
import 'package:flutter/material.dart';

class ProgressChart extends StatelessWidget {
  ProgressChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: Offset.zero,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 125,
                    height: 40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            offset: Offset.zero,
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text("Week"),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down_rounded,
                                size: 30),
                          )
                        ]),
                  ),
                  Text("Questions Completed",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodySmall?.fontSize))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: SizedBox(
                height: 175,
                child: Chart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
