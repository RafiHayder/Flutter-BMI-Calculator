import 'file:///C:/Users/Raafi/AndroidStudioProjects/bmi_calculator/lib/components/reuseableContainer.dart';
import 'package:flutter/material.dart';
import '../allConstant.dart';
import '../components/reusableButton.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.resultText, @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  'Your Result',
                  style: kResultFirstText,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              c: kInactiveContainerColor,
              w: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultSecondText,
                  ),
                  Text(
                    bmiResult,
                    style: kResultThirdText,
                  ),
                  Text(
                    interpretation,
                    style: kResultFourthText,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          ReusableButton(
              t: 'Re-Calculate',
              tap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
