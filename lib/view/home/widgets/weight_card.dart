// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helperWidgets/triangleClipper.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
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
          BlocBuilder<BmiCubit, BmiState>(
            builder: (context, state) {
              return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Weight',
                  style: TextStyle(fontSize: 20, color: Styles.textColor),
                  children: [
                    TextSpan(
                      text: '\n${state.person.weight}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(style: BorderStyle.none),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: BlocBuilder<BmiCubit, BmiState>(
                          builder: (context, state) {
                            return ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: 100,
                              itemBuilder: ((context, index) {
                                final weight = 40 + index;
                                return Center(
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<BmiCubit>(context).setSelectWeight(weight, index);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        weight.toString(),
                                        style: state.selectedWeightIndex == index
                                            ? Styles.kTexStyleBold
                                            : Styles.kTexStyle,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
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
}
