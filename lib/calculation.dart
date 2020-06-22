import 'dart:math';

class CalculateBMI {
  CalculateBMI({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi = 0.0;
  String calc() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getCategory() {
    if (_bmi < 18.5)
      return "UNDERWEIGHT";
    else if (_bmi >= 18.5 && _bmi < 25)
      return "NORMAL";
    else if (_bmi >= 25 && _bmi < 30)
      return "OVERWEIGHT";
    else {
      return "OBESE";
    }
  }

  String getDescription() {
    if (_bmi <= 18.5)
      return "You need to eat more healthy foods and do yoga.";
    else if (_bmi > 18.5 && _bmi <= 24.9)
      return "You are in the good range. Maintain your current diet and exercise regularly.";
    else if (_bmi > 24.9 && _bmi <= 29.9)
      return "Eat lots of green vegetables and cut down on your carbohydrate intake. Exercise daily. Have a balanced diet.";
    else {
      return "You should visit a nutritionist and get him / her to set you up with the diet that your body needs. Go to the gym as well.";
    }
  }
}
