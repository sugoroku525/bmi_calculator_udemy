import 'package:flutter/material.dart';
import '../constant.dart';


class BottomButton extends StatelessWidget {


  BottomButton({@required this.onTap,@required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child:Text(buttonTitle,
        style: kLargeButtonTextStyle,),
        color: kBotomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom:20.0),
        width: double.infinity,
        height: kBottomContainerheight,
      ),
    );
  }
}

