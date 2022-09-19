// ignore: file_names
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/bmi_cubit.dart';
import 'helperWidgets/tick_mark_shape.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({super.key});

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
        child: Column(
          children: [
            BlocBuilder<BmiCubit, BmiState>(
              builder: (context, state) {
                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Your Hight',
                    style: TextStyle(fontSize: 20, color: Styles.textColor),
                    children: [
                      TextSpan(
                        text: '\n${state.height.toStringAsFixed(0)} cm',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // sliderWidget,
            BlocBuilder<BmiCubit, BmiState>(
              builder: (context, state) {
                return SfSliderTheme(
                  data: SfSliderThemeData(
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                    activeLabelStyle: const TextStyle(color: Colors.black, fontSize: 12, fontStyle: FontStyle.normal),
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
                    value: state.height,
                    onChanged: (value) {
                      BlocProvider.of<BmiCubit>(context).setSelectedHeight(value);
                      // setState(() {
                      //   height = value;
                      // });
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
