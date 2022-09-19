part of 'bmi_cubit.dart';

class BmiState extends Equatable {
  final Person person;
  final int selectedWeightIndex;
  final String bmiResultText;
  final String description;

  const BmiState({
    required this.person,
    required this.selectedWeightIndex,
    required this.bmiResultText,
    required this.description,
  });

  @override
  List<Object> get props => [selectedWeightIndex, bmiResultText, description, person];

  BmiState copyWith({
    Person? person,
    int? selectedWeightIndex,
    String? bmiResultText,
    String? description,
  }) {
    return BmiState(
      selectedWeightIndex: selectedWeightIndex ?? this.selectedWeightIndex,
      bmiResultText: bmiResultText ?? this.bmiResultText,
      description: description ?? this.description,
      person: person ?? this.person,
    );
  }
}
