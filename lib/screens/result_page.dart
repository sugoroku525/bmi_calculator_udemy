
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../components/reusable_card.dart';
import '../components/buttom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmiResult,this.interpretation,this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('BMI CALCULATOR'),
        ),     
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Container(
              padding:EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text('Your Result',
              style:kTitleTextaStyle),
            )
            ),
            Expanded(flex:5,
            child:ReusableCard(colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                Text(resultText,style: resultTextStyle,),
                Text(bmiResult,
                style: kBMITextstyle,),
                Text(interpretation, 
                textAlign: TextAlign.center,
                style:kBOdyTextStyle,),
                
              ],),)
            ),
            BottomButton (
                  buttonTitle:'RE-CALCULATE',
                  onTap:(){
                    Navigator.pop(context);
                  }
                )
          ],)
    );
  }
}