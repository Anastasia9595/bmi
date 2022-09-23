import 'dart:developer';

import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/cubit/person_list_cubit.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/view/personlist/persons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopupCard extends StatelessWidget {
  const PopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: 'hero-tag',
          child: Material(
            color: Styles.accentColor,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: myController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your Name',
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Close',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                        BlocBuilder<BmiCubit, BmiState>(
                          builder: (context, bmistate) {
                            return BlocBuilder<PersonListCubit, PersonListState>(
                              builder: (context, personliststate) {
                                return TextButton(
                                  onPressed: () {
                                    if (myController.text.isNotEmpty) {
                                      BlocProvider.of<PersonListCubit>(context)
                                          .addPersonToList(bmistate.person, myController.text);

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) => const PersonListPage()),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white, fontSize: 22),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
