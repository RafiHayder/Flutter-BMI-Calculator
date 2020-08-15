import 'package:flutter/material.dart';

class RoundCircleButton extends StatelessWidget {
  final IconData icon;
  final Function presss;
  RoundCircleButton({this.icon, this.presss});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: presss,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
