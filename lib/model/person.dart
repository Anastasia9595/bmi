import 'package:equatable/equatable.dart';

import 'package:bmi_calculator/utils/constants.dart';

class Person extends Equatable {
  final int id;
  final String name;
  final double height;
  final int weight;
  final int age;
  final Gender gender;
  final double bmi;
  final String bmiResult;

  const Person({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.bmi,
    required this.bmiResult,
  });

  @override
  List<Object> get props => [height, weight, age, gender, bmi, name, gender];

  Person copyWith({
    int? id,
    String? name,
    double? height,
    int? weight,
    int? age,
    Gender? gender,
    double? bmi,
    String? bmiResult,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      bmi: bmi ?? this.bmi,
      bmiResult: bmiResult ?? this.bmiResult,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'height': height,
      'weight': weight,
      'age': age,
      'gender': gender.index,
      'bmi': bmi,
      'bmiResult': bmiResult,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    int val = map['gender'];
    return Person(
      id: map['id'] as int,
      name: map['name'] as String,
      height: map['height'] as double,
      weight: map['weight'] as int,
      age: map['age'] as int,
      gender: Gender.values[val],
      bmi: map['bmi'] as double,
      bmiResult: map['bmiResult'] as String,
    );
  }
}
