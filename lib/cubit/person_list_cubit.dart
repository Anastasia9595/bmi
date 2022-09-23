import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:equatable/equatable.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../model/person.dart';

part 'person_list_state.dart';

class PersonListCubit extends Cubit<PersonListState> with HydratedMixin {
  PersonListCubit()
      : super(
          const PersonListState(autoId: 0, personList: []),
        ) {
    hydrate();
  }

  void addPersonToList(
    Person person,
    String name,
  ) {
    Person newPerson = Person(
      id: state.autoId + 1,
      name: name,
      height: person.height,
      weight: person.weight,
      age: person.weight,
      gender: person.gender,
      bmi: person.bmi,
      bmiResult: person.bmiResult,
    );

    emit(state.copyWith(
      autoId: state.autoId + 1,
      personList: [newPerson, ...state.personList],
    ));
  }

  void removePersonfromList(int id) {
    emit(state.copyWith(personList: state.personList.where((element) => element.id != id).toList()));
  }

  @override
  PersonListState? fromJson(Map<String, dynamic> json) {
    return PersonListState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(PersonListState state) {
    return state.toMap();
  }
}
