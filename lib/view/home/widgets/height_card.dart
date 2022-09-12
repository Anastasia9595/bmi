// ignore: file_names

import 'package:bmi_calculator/helpers/app_styles.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({super.key, required this.name, required this.sliderWidget, required this.size});

  final String name;
  final Widget sliderWidget;
  final String size;

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
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: name,
                style: TextStyle(fontSize: 20, color: Styles.textColor),
                children: [
                  TextSpan(
                    text: '\n$size cm',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            sliderWidget,
          ],
        ),
      ),
    );
  }
}
