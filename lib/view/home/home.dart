import 'package:bmi_calculator/view/home/widgets/height_card.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/tick_mark_shape.dart';

import 'package:bmi_calculator/view/home/widgets/userCard.dart';
import 'package:bmi_calculator/view/home/widgets/weight_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../helpers/app_styles.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  double height = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
                text: 'BMI',
                style: TextStyle(
                  color: Styles.textColorHeadline,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Calculator',
                    style: Styles.headLineStyle2,
                  ),
                ]),
          )),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: UserCard(
                      name: 'Woman',
                      image: AssetImage('assets/woman.png'),
                    ),
                  ),
                  Expanded(
                    child: UserCard(
                      name: 'Man',
                      image: AssetImage('assets/man.png'),
                    ),
                  ),
                  Expanded(
                    child: UserCard(
                      name: 'Other',
                      image: AssetImage('assets/gender.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  HeightCard(
                      name: 'Your Height',
                      size: height.toStringAsFixed(0),
                      sliderWidget: SfSliderTheme(
                        data: SfSliderThemeData(
                          activeTrackColor: Colors.transparent,
                          inactiveTrackColor: Colors.transparent,
                          activeLabelStyle:
                              const TextStyle(color: Colors.black, fontSize: 12, fontStyle: FontStyle.normal),
                          inactiveLabelStyle:
                              TextStyle(color: Colors.grey.shade500, fontSize: 12, fontStyle: FontStyle.normal),
                          activeTickColor: Colors.black,
                          overlayRadius: 0,
                        ),
                        child: SfSlider(
                          min: 120,
                          max: 220,
                          interval: 10,
                          showTicks: true,
                          showLabels: true,
                          thumbShape: TickMarkShape(),
                          minorTicksPerInterval: 5,
                          value: height,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  WeightCard(
                    name: 'Weight',
                    sliderTextWidget: Text('Slider'),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
