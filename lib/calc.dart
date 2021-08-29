import 'dart:math';

class CaluculatorBrain {
CaluculatorBrain({this.height,this.weight});
final int height;
final int weight;

  String calculateBMI(){
    double bmi = weight / pow(height,2);
    return bmi.toStringAsFixed(1);
  }

  double _bmi;
  String getResult(){
    if(_bmi >=25){
        return 'OverWeight';
    }
    else if(_bmi > 18.5){
      return 'Normal';
    }
      else{
        return 'UnderWeight';
      
    }
  }
  String getInterpretation(){
    if(_bmi >=25){
        return 'you should eat less';
    }
    else if(_bmi > 18.5){
      return 'stay';
    }
      else{
        return 'you should eat more';
      
    }
  }
}
