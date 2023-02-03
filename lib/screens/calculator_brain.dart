import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;
  final double _bmi;

  CalculatorBrain({required this.weight, required this.height})
      : _bmi = weight / pow(height / 100, 2);

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have lower than body weight. You can eat a bit more.';
    }
  }
}
