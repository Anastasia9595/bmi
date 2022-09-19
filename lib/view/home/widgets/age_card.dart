import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import 'helperWidgets/round_icon_button.dart';

class AgeCard extends StatelessWidget {
  const AgeCard({
    super.key,
  });

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
                    text: 'Age',
                    style: TextStyle(fontSize: 20, color: Styles.textColor),
                    children: [
                      TextSpan(
                        text: '\n${state.age}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                    icon: Icons.add,
                    onPressed: () {
                      BlocProvider.of<BmiCubit>(context).incrementAge();
                    }),
                RoundIconButton(
                    icon: Icons.remove,
                    onPressed: () {
                      BlocProvider.of<BmiCubit>(context).decrementAge();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
