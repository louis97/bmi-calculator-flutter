import 'dart:math';
class CalculatorBrain {
  final int weight;
  final int height;
  double _bmi;

  CalculatorBrain(this.weight,this.height){
    _bmi=weight/ pow(height/100,2);
  }

  String calculateBMI(){
    return _bmi.toStringAsFixed(1);
  }

  String getBMIResults(){
    String result='';
    if(_bmi>= 25){
      result='OVERWEIGHT';
    }else if(_bmi>18.5){
      result='Normal';
    }else{
      result='Underweight';
    }
    return result;
  }

  String getBMIInterpretation(){
    String result='';
    if(_bmi>= 25){
      result='You have a higher than normal bodyweight. Try to exercise more.';
    }else if(_bmi>18.5){
      result='You have a normal body wight. Good job!';
    }else{
      result='You have a lowe than normal body weight. You can eat a bit more.';
    }
    return result;
  }

}