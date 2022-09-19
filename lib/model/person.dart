// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:bmi_calculator/utils/constants.dart';

class Person extends Equatable {
  final int height;
  final int weight;
  final int age;
  final Gender gender;
  final int selectedWeightIndex;

  const Person({
    required this.selectedWeightIndex,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  @override
  List<Object> get props => [height, weight, age, gender];

  Person copyWith({
    int? height,
    int? selectedWeightIndex,
    int? weight,
    int? age,
    Gender? gender,
  }) {
    return Person(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      selectedWeightIndex: selectedWeightIndex ?? this.selectedWeightIndex,
    );
  }
}
