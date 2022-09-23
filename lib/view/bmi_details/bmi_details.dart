import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/hero_dialog_route.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/popup_card_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BMIDetail extends StatelessWidget {
  const BMIDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BmiCubit>().state;

    return Container(
      height: double.maxFinite * 0.5,
      decoration: BoxDecoration(
        color: Styles.kBottomContainerColour,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
            height: Get.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Your Bmi is',
                  style: Styles.kTextStyleWhiteboldTitle,
                ),
                const SizedBox(height: 10),
                Text(
                  '${state.person.bmi.toStringAsFixed(2)} kg/m2',
                  style: Styles.kTextStyleWhiteboldsubtitle,
                ),
                const SizedBox(height: 12),
                Text(
                  state.person.bmiResult,
                  style: Styles.kTextStyleWhiteResult,
                ),
                const SizedBox(height: 30),
                Text(
                  state.description,
                  style: Styles.kTextStyleWhite,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<BmiCubit>().clearInfo();
                        state.controller.jumpTo(0);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A1028),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Center(
                          child: Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          HeroDialogRoute(builder: (context) {
                            return const PopupCard();
                          }),
                        );
                      },
                      child: const Hero(
                        tag: 'hero-tag',
                        child: Icon(Icons.bookmark_add, color: Colors.white, size: 26),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
