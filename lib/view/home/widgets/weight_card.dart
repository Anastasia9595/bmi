// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bmi_calculator/helpers/app_styles.dart';
import 'package:flutter/material.dart';

import 'helperWidgets/triangleClipper.dart';

class WeightCard extends StatelessWidget {
  WeightCard({super.key, required this.name, required this.child, required this.weight});

  final String name;
  final Widget child;

  final weight;
  int selectedWeightIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: name,
              style: TextStyle(fontSize: 20, color: Styles.textColor),
              children: [
                TextSpan(
                  text: '\n$weight',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(style: BorderStyle.none),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: child,
                      ),
                    ],
                  ),
                ),
              ),
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height * 0.01,
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
