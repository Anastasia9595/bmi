import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/cubit/person_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({super.key, required this.name, required this.bmi, required this.id, required this.bmiResult});

  final String name;
  final double bmi;
  final int id;
  final String bmiResult;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.pinkAccent.shade100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              '$name\n',
              style: Styles.kTextStyleWhiteboldTitle,
            ),
            subtitle: Text(
              'Your Bmi is: ${bmi.toStringAsFixed(2)} \n It is: $bmiResult',
              style: Styles.kTextStyleWhiteboldsubtitle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 8),
              TextButton(
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  BlocProvider.of<PersonListCubit>(context).removePersonfromList(id);
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
