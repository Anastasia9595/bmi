import 'package:flutter/material.dart';
import '../../../../helpers/app_styles.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap, required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: Styles.kBottomContainerColour,
        margin: const EdgeInsets.only(top: 40.0, bottom: 40, left: 20, right: 20),
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: Styles.kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: Styles.kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
