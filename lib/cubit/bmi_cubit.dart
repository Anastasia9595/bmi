import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/model/person.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> with HydratedMixin {
  BmiCubit()
      : super(BmiState(
          selectedWeightIndex: 0,
          bmiResultText: '',
          description: '',
          person: const Person(height: 160, weight: 40, age: 21, gender: Gender.none, bmiResult: 0, name: '', id: 0),
          isClosed: false,
          controller: ScrollController(),
        )) {
    hydrate();
  }

  void incrementAge() {
    final person = state.person;
    final newPerson = person.copyWith(age: person.age + 1);
    emit(state.copyWith(person: newPerson));
  }

  void decrementAge() {
    final person = state.person;
    final newPerson = person.copyWith(age: person.age - 1);
    emit(state.copyWith(person: newPerson));
  }

  void setSelectWeight(weight, index) {
    final person = state.person;
    final newPerson = person.copyWith(weight: weight);
    emit(state.copyWith(selectedWeightIndex: index, person: newPerson));
  }

  void setSelectedHeight(height) {
    final person = state.person;
    final newPerson = person.copyWith(height: height);
    emit(state.copyWith(
      person: newPerson,
    ));
  }

  double setBmiResult() {
    final bmiResult = state.person.weight / pow(state.person.height / 100, 2);
    final person = state.person;
    final newPerson = person.copyWith(bmiResult: bmiResult);
    emit(
      state.copyWith(
        person: newPerson,
      ),
    );
    return bmiResult;
  }

  void setGender(Gender gender) {
    final person = state.person;
    final newPerson = person.copyWith(gender: gender);
    emit(state.copyWith(person: newPerson));
  }

  void setBmiCategory() {
    final result = setBmiResult();
    final String description;
    final String bmiResultText;
    if (result < 18.5) {
      bmiResultText = 'Underweight';
      description = "You're in the underweight range. "
          "Eating at least 5 portions of a variety of fruit and vegetables every day. Basing meals on potatoes, bread, rice, pasta or other starchy carbohydrates. Having some dairy or dairy alternatives (such as soya drinks and yoghurts).";
    } else if (result > 18.5 && result < 24.9) {
      bmiResultText = 'Healthy Weight';
      description = "A BMI of 18.5 - 24.9 "
          "indicates that you are at healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.";
    } else if (result > 25.0 && result < 29.9) {
      bmiResultText = 'Overweight';
      description =
          "Common treatments for overweight include losing weight through healthy eating,being more physically active, and making other changes to your usual habits. Weight-management programs may help some people lose weight or keep from regaining lost weight.";
    } else {
      bmiResultText = 'Obesity';
      description =
          "A BMI above 30 indicates that a person is morbidly obese and therefore a candidate for bariatric surgery. Bariatric surgery may also be an option for people with a BMI between 35 and 40 who suffer from life-threatening cardiopulmonary problems, diabetes, or other medical problems listed below.";
    }

    emit(state.copyWith(bmiResultText: bmiResultText, description: description));
  }

  void clearInfo() {
    emit(state.copyWith(
      isClosed: false,
      selectedWeightIndex: 0,
      bmiResultText: '',
      description: '',
      person:
          Person(height: 160, weight: 40, age: 21, gender: Gender.none, bmiResult: 0, name: '', id: state.person.id),
    ));
  }

  void setClosedToTrue() {
    emit(state.copyWith(isClosed: true));
  }

  @override
  BmiState? fromJson(Map<String, dynamic> json) {
    BmiState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BmiState state) {
    state.toMap();
  }
}
