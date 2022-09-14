import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: () => onPressed(),
      constraints: const BoxConstraints.tightFor(
        width: 40,
        height: 40.0,
      ),
      shape: const CircleBorder(),
      fillColor: Colors.grey.shade300,
    );
  }
}
