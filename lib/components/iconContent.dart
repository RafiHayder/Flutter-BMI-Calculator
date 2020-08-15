import 'package:flutter/material.dart';
import '../allConstant.dart';


class IconContent extends StatelessWidget {
  final IconData i;
  final String s;
  IconContent({this.i, this.s});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(i,size: 80.0),
        SizedBox(height: 15.0,),
        Text(s,style: kSty)
      ],);
  }
}
