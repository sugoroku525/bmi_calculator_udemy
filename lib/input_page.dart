import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icno_content.dart';
import 'reusable_card.dart';

const bottomContainerheight = 80.0;
const activeCardColour = Color(0xFF1D1E3);
const botomContainerColour = Color(0xFFEB1555);
const inactiveCardColour = Color(0xFF11328);
enum gendertype {
    male,
    female
  }
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gendertype selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children:<Widget>[
          Expanded(child: Row(children:<Widget> [
            Expanded(child:GestureDetector (
              onTap:(){
                setState(() {
                  selectedGender = gendertype.male;
                });
              },
              child: new ReusableCard(colour:selectedGender  == gendertype.male ? activeCardColour : inactiveCardColour,
              cardChild:IconContent(icon: FontAwesomeIcons.mars, label:'MALE')),
            )),
            Expanded(child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedGender = gendertype.female;
                });
              },
              child: ReusableCard(colour:selectedGender == gendertype.female ? activeCardColour:inactiveCardColour
              ,cardChild:IconContent(icon: FontAwesomeIcons.venus, label:'FEMALE')),
            ),
            ),
          ],)),
          Expanded(child:ReusableCard(colour:activeCardColour),),
          Expanded(child:Row(children:<Widget> [
            Expanded(child: ReusableCard(colour:activeCardColour),),
            Expanded(child: ReusableCard(colour:activeCardColour),),
            Container(
              color:botomContainerColour,
              margin:EdgeInsets.only(top:10.0),
              width:double.infinity,
              height:bottomContainerheight,
            )
          ],)),
        ]
      )
      
    );
  }
}
