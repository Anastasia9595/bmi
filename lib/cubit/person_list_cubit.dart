import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:equatable/equatable.dart';

import '../model/person.dart';

part 'person_list_state.dart';

class PersonListCubit extends Cubit<PersonListState> {
  PersonListCubit() : super(const PersonListState(autoId: 0, personList: []));

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
        bmiResult: person.bmiResult);

    emit(state.copyWith(
      autoId: state.autoId + 1,
      personList: [...state.personList, newPerson],
    ));
  }

  void removePersonfromList(int id) {
    emit(state.copyWith(personList: state.personList.where((element) => element.id != id).toList()));
  }
}
