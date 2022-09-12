import 'package:bmi_calculator/helpers/app_styles.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/carousel_slider_widget.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  WeightCard({super.key, required this.name, required this.sliderTextWidget});

  final String name;
  final Widget sliderTextWidget;
  var itemList = List<String>.generate(200, (index) => '$index');

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
          Text(
            name,
            style: TextStyle(fontSize: 20, color: Styles.textColor),
          ),
          const SizedBox(
            height: 10,
          ),
          sliderTextWidget,
        ]),
      ),
    );
  }
}
