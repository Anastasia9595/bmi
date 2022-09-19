import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/view/home/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BmiCubit>(
      create: (context) => BmiCubit(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
