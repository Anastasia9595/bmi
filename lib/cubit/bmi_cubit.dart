import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:equatable/equatable.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit()
      : super(const BmiState(
          age: 21,
          weight: 40,
          selectedWeightIndex: 0,
          height: 160,
          bmiResult: 0,
          gender: Gender.none,
          bmiResultText: '',
          description: '',
        ));

  void incrementAge() => emit(state.copyWith(
      age: state.age + 1,
      weight: state.weight,
      selectedWeightIndex: state.selectedWeightIndex,
      height: state.height,
      bmiResult: state.bmiResult));

  void decrementAge() => emit(state.copyWith(
      age: state.age > 0 ? state.age - 1 : state.age,
      weight: state.weight,
      selectedWeightIndex: state.selectedWeightIndex,
      height: state.height,
      bmiResult: state.bmiResult));

  void setSelectWeight(weight, index) => emit(state.copyWith(
      age: state.age, weight: weight, selectedWeightIndex: index, height: state.height, bmiResult: state.bmiResult));

  void setSelectedHeight(height) => emit(state.copyWith(
        height: height,
      ));

  double setBmiResult() {
    final bmiResult = state.weight / pow(state.height / 100, 2);
    emit(
      state.copyWith(
        bmiResult: bmiResult,
      ),
    );
    return bmiResult;
  }

  void setGender(Gender gender) => emit(state.copyWith(gender: gender));

  void setBmiCategory() {
    final result = setBmiResult();
    final String description;
    final String bmiResult;
    if (result < 18.5) {
      bmiResult = 'Underweight';
      description = "You're in the underweight range. "
          "Eating at least 5 portions of a variety of fruit and vegetables every day. Basing meals on potatoes, bread, rice, pasta or other starchy carbohydrates. Having some dairy or dairy alternatives (such as soya drinks and yoghurts).";
    } else if (result > 18.5 && result < 24.9) {
      bmiResult = 'Healthy Weight';
      description = "A BMI of 18.5 - 24.9 "
          "indicates that you are at healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.";
    } else if (result > 25.0 && result < 29.9) {
      bmiResult = 'Overweight';
      description =
          "Common treatments for overweight include losing weight through healthy eating,being more physically active, and making other changes to your usual habits. Weight-management programs may help some people lose weight or keep from regaining lost weight.";
    } else {
      bmiResult = 'Obesity';
      description =
          "A BMI above 30 indicates that a person is morbidly obese and therefore a candidate for bariatric surgery. Bariatric surgery may also be an option for people with a BMI between 35 and 40 who suffer from life-threatening cardiopulmonary problems, diabetes, or other medical problems listed below.";
    }

    emit(state.copyWith(bmiResultText: bmiResult, description: description));
  }
}
