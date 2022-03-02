import 'dart:math';

class Brain {
  Brain({required this.height, required this.weight});
  final int height;
  final int weight;

  String getBMI() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    double bmi = double.parse(getBMI());
    return bmi >= 25
        ? 'Overweight'
        : bmi > 18.5
            ? 'Normal'
            : 'Underweight';
  }

  String getInterpretation() {
    double bmi = double.parse(getBMI());
    return bmi >= 25
        ? 'You have an overweight body.'
        : bmi > 18.5
            ? 'You have a normal body weight. Good Job!'
            : 'You are underweight for your height.';
  }
}
