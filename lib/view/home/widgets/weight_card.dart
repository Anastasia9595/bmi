// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bmi_calculator/helpers/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'helperWidgets/triangleClipper.dart';

class WeightCard extends StatefulWidget {
  const WeightCard({super.key, required this.name});

  final String name;

  @override
  State<WeightCard> createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  var itemList = List<String>.generate(10, (index) => '$index');
  var _weight = 40;
  var selectedWeightIndex = 0;

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
            widget.name,
            style: TextStyle(fontSize: 20, color: Styles.textColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text('$_weight'),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(style: BorderStyle.none),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.of(context).size.width * 0.25,
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.20,
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
                    ],
                  ),
                ),
              ),
              // ClipPath(
              //   clipper: TriangleClipper(),
              //   child: Container(
              //     color: Colors.black,
              //     height: MediaQuery.of(context).size.height * 0.01,
              //     width: MediaQuery.of(context).size.width * 0.04,
              //   ),
              // ),
            ],
          )
        ]),
      ),
    );
  }
}
