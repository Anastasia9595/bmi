part of 'bmi_cubit.dart';

class BmiState extends Equatable {
  final int age;
  final int weight;
  final int selectedWeightIndex;
  final double height;
  final double bmiResult;
  final Gender gender;
  final String bmiResultText;
  final String description;

  const BmiState({
    required this.age,
    required this.weight,
    required this.selectedWeightIndex,
    required this.height,
    required this.bmiResult,
    required this.gender,
    required this.bmiResultText,
    required this.description,
  });

  @override
  List<Object> get props => [age, weight, selectedWeightIndex, height, bmiResult, gender, bmiResultText, description];

  BmiState copyWith({
    int? age,
    int? weight,
    int? selectedWeightIndex,
    double? height,
    double? bmiResult,
    Gender? gender,
    String? bmiResultText,
    String? description,
  }) {
    return BmiState(
      age: age ?? this.age,
      weight: weight ?? this.weight,
      selectedWeightIndex: selectedWeightIndex ?? this.selectedWeightIndex,
      height: height ?? this.height,
      bmiResult: bmiResult ?? this.bmiResult,
      gender: gender ?? this.gender,
      bmiResultText: bmiResultText ?? this.bmiResultText,
      description: description ?? this.description,
    );
  }
}
