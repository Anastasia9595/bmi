part of 'bmi_cubit.dart';

class BmiState extends Equatable {
  final Person person;
  final int selectedWeightIndex;
  // final String bmiResultText;
  final String description;
  final bool isClosed;
  final ScrollController controller;

  const BmiState({
    required this.person,
    required this.selectedWeightIndex,
    // required this.bmiResultText,
    required this.description,
    required this.isClosed,
    required this.controller,
  });

  @override
  List<Object> get props => [selectedWeightIndex, description, person, isClosed, controller];

  BmiState copyWith({
    Person? person,
    int? selectedWeightIndex,
    // String? bmiResultText,
    String? description,
    bool? isClosed,
    ScrollController? controller,
  }) {
    return BmiState(
      selectedWeightIndex: selectedWeightIndex ?? this.selectedWeightIndex,
      // bmiResultText: bmiResultText ?? this.bmiResultText,
      description: description ?? this.description,
      person: person ?? this.person,
      isClosed: isClosed ?? this.isClosed,
      controller: controller ?? this.controller,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'person': person.toMap(),
      'selectedWeightIndex': selectedWeightIndex,
      // 'bmiResultText': bmiResultText,
      'description': description,
      'isClosed': isClosed,
      'controller': controller,
    };
  }

  factory BmiState.fromMap(Map<String, dynamic> map) {
    return BmiState(
        person: Person.fromMap(map['person'] as Map<String, dynamic>),
        selectedWeightIndex: map['selectedWeightIndex'] as int,
        // bmiResultText: map['bmiResultText'] as String,
        description: map['description'] as String,
        isClosed: map['isClosed'] as bool,
        controller: map['controller'] as ScrollController);
  }
}
