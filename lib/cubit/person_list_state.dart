part of 'person_list_cubit.dart';

class PersonListState extends Equatable {
  final int autoId;
  final List<Person> personList;

  const PersonListState({required this.personList, required this.autoId});

  @override
  List<Object> get props => [personList, autoId];

  PersonListState copyWith({
    int? autoId,
    List<Person>? personList,
  }) {
    return PersonListState(
      autoId: autoId ?? this.autoId,
      personList: personList ?? this.personList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'autoId': autoId,
      'personList': personList.map((x) => x.toMap()).toList(),
    };
  }

  factory PersonListState.fromMap(Map<String, dynamic> map) {
    return PersonListState(
      autoId: map['autoId'] as int,
      personList: List<Person>.from(map['personList'].map((x) => Person.fromMap(x))),
    );
  }
}
