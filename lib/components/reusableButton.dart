import 'package:flutter/material.dart';
import '../allConstant.dart';

class ReusableButton extends StatelessWidget {
  final String t;
  final Function tap;
  ReusableButton ({@required this.t,@required this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(t,style: kButtonStyle),),
      ),
    );
  }
}
