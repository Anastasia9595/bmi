part of 'bmi_cubit.dart';

class BmiState extends Equatable {
  final Person person;
  final int selectedWeightIndex;
  final String bmiResultText;
  final String description;
  final bool isClosed;
  final ScrollController controller;

  const BmiState({
    required this.person,
    required this.selectedWeightIndex,
    required this.bmiResultText,
    required this.description,
    required this.isClosed,
    required this.controller,
  });

  @override
  List<Object> get props => [selectedWeightIndex, bmiResultText, description, person, isClosed, controller];

  BmiState copyWith({
    Person? person,
    int? selectedWeightIndex,
    String? bmiResultText,
    String? description,
    bool? isClosed,
    ScrollController? controller,
  }) {
    return BmiState(
      selectedWeightIndex: selectedWeightIndex ?? this.selectedWeightIndex,
      bmiResultText: bmiResultText ?? this.bmiResultText,
      description: description ?? this.description,
      person: person ?? this.person,
      isClosed: isClosed ?? this.isClosed,
      controller: controller ?? this.controller,
    );
  }
}
