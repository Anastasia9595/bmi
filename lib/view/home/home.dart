import 'dart:math';

import 'package:bmi_calculator/view/bmi_details/bmi_details.dart';
import 'package:bmi_calculator/view/home/widgets/ageCard.dart';
import 'package:bmi_calculator/view/home/widgets/height_card.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/bottom_button.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/round_icon_button.dart';

import 'package:bmi_calculator/view/home/widgets/helperWidgets/tick_mark_shape.dart';

import 'package:bmi_calculator/view/home/widgets/userCard.dart';
import 'package:bmi_calculator/view/home/widgets/weight_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../helpers/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 160;
  int _weight = 40;
  int selectedWeightIndex = 0;
  int age = 30;
  double bmi = 0;
  void _calculateBMIShowResult(BuildContext context) {
    calculateBMI();
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      context: context,
      builder: (ctx) {
        return BMIDetail(
          bmi: bmi.toStringAsFixed(1),
        );
      },
    );
  }

  void getSelectedWeightIndex(int index, int weight) {
    setState(() {
      selectedWeightIndex = index;
      _weight = weight;
    });
  }

  void calculateBMI() {
    bmi = (_weight / pow(height / 100, 2));
  }

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
                  Expanded(
                    child: WeightCard(
                      name: 'Weight',
                      weight: _weight,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 100,
                        itemBuilder: ((context, index) {
                          final weight = 40 + index;
                          return Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _weight = weight;
                                  selectedWeightIndex = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  weight.toString(),
                                  style: selectedWeightIndex == index ? Styles.kTexStyleBold : Styles.kTexStyle,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AgeCard(
                      name: 'Age',
                      age: age.toStringAsFixed(0),
                      buttonWidgetAdd: RoundIconButton(
                          icon: Icons.add,
                          onPressed: () {
                            if (age <= 99) {
                              setState(() {
                                age++;
                              });
                            }
                          }),
                      buttonWidgetRemove: RoundIconButton(
                          icon: Icons.remove,
                          onPressed: () {
                            if (age > 1) {
                              setState(() {
                                age--;
                              });
                            }
                          }),
                    ),
                  ),
                ],
              ),
              BottomButton(
                  onTap: () {
                    _calculateBMIShowResult(context);
                  },
                  buttonTitle: 'Calculate BMI')
            ],
          ),
        ],
      ),
    );
  }
}
