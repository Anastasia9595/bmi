import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Styles.kBottomContainerColour,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        margin: const EdgeInsets.only(top: 40.0, bottom: 40, left: 20, right: 20),
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: Styles.kBottomContainerHeight,
        child: Center(
          child: Text(
            'Calculate BMI',
            style: Styles.kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
