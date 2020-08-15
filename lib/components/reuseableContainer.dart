import 'package:flutter/material.dart';
class ReusableContainer extends StatelessWidget {
  final Color c;
  final Widget w;
  final Function press;
  ReusableContainer({@required this.c,this.w,this.press});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: w,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: c,
            borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
  }
}
