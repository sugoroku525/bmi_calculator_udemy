import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icno_content.dart';
import '../components/reusable_card.dart';
import '../constant.dart';
import '../main.dart';
import '../components/buttom_button.dart';
import '../components/round_icon_button.dart';
import '../calc.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 140;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  )),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconContent(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE')),
                  ),
                ],
              )),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'height',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: kNumberTextStyle),
                          Text('cm', style: kLabelTextStyle)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTickMarkColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: kLabelTextStyle),
                          Text(
                            weight.toString(),
                            style: kLabelTextStyle,
                          ),
                          Row(children: <Widget>[
                            
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              icon:FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              icon:FontAwesomeIcons.plus,
                              
                              
                            ),
                          ])
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE', style: kLabelTextStyle),
                          Text(
                            age.toString(),
                            style: kLabelTextStyle,
                          ),
                          Row(children: <Widget>[
                            
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              icon:FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(icon:FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              
                              
                              
                            ),
                          ])
                        ],
                      ),
                    ),
                  ), ],
              )
              ),
                  BottomButton(buttonTitle: 'CALCULATE',
                  onTap:(){ 
                    CaluculatorBrain calc = CaluculatorBrain(height:height,weight:weight);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                      bmiResult:calc.calculateBMI(),
                      resultText:calc.getResult(),
                      interpretation:calc.getInterpretation() ,
                    )
                    )
                    );  
                  }
                  )
                ,
            ]));
  }
}

