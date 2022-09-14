import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../helpers/app_styles.dart';

class AgeCard extends StatelessWidget {
  const AgeCard({
    super.key,
    required this.name,
    required this.age,
    required this.buttonWidgetAdd,
    required this.buttonWidgetRemove,
  });
  final String name;
  final String age;
  final Widget buttonWidgetAdd;
  final Widget buttonWidgetRemove;

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
                    text: '\n$age',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonWidgetAdd,
                buttonWidgetRemove,
              ],
            )
          ],
        ),
      ),
    );
  }
}
