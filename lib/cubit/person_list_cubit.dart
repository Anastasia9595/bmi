import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/person.dart';
import '../utils/constants.dart';

part 'person_list_state.dart';

class PersonListCubit extends Cubit<PersonListState> {
  PersonListCubit() : super(PersonListState(personList: []));

  void addPersonToList(String name, double height, int weight, int age, Gender gender, double bmiResult) {
    Person person = Person(name: name, height: height, weight: weight, age: age, gender: gender, bmiResult: bmiResult);
    emit(state.copyWith(personList: [...state.personList, person]));
  }

  // name muss durch eine id getauscht werden
  void removePersonfromList() {
    emit(state.copyWith(personList: state.personList.where((element) => element.name != element.name).toList()));
  }
}
