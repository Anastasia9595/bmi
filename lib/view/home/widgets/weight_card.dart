import 'package:bmi_calculator/helpers/app_styles.dart';

import 'package:flutter/material.dart';

import 'helperWidgets/triangleClipper.dart';

class WeightCard extends StatelessWidget {
  WeightCard({super.key, required this.name});

  final String name;

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
                            itemCount: itemList.length,
                            itemBuilder: ((context, index) => buildCard(index))),
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

  Widget buildCard(int index) => SizedBox(
        width: 30,
        height: 30,
        child: Center(child: Text('${index + 1}')),
      );
}
