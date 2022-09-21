part of 'person_list_cubit.dart';

class PersonListState extends Equatable {
  final List<Person> personList;

  PersonListState({required this.personList});

  @override
  List<Object> get props => [personList];

  PersonListState copyWith({
    List<Person>? personList,
  }) {
    return PersonListState(
      personList: personList ?? this.personList,
    );
  }
}
