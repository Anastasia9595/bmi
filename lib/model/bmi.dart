import 'dart:math';

class BmiCalculator {
  int height;
  int weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  BmiCalculator({
    this.height = 160,
    this.weight = 50,
  });
}
