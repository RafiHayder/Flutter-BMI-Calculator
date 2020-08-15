import 'dart:math';
class CalculateBrain {
  CalculateBrain({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI (){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult () {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }
  String getInterpretation () {
    if (_bmi >= 25) {
      return 'YOU are Overweight. Eat less, Live more.';
    } else if (_bmi >= 18.5) {
      return 'You are normal. Carry on..';
    } else {
      return 'You are underweight. Eat more,Live more';
    }
  }

}