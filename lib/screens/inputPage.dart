import 'package:bmi_calculator/screens/resultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/iconContent.dart';
import '../components/reuseableContainer.dart';
import '../allConstant.dart';
import '../components/reusableButton.dart';
import '../components/reusableRoundCircularButton.dart';
import 'package:bmi_calculator/calculateBrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableContainer(
                press: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                c: selectedGender == Gender.male
                    ? kActiveContainerColor
                    : kInactiveContainerColor,
                w: IconContent(
                  i: FontAwesomeIcons.male,
                  s: 'MALE',
                ),
              )),
              Expanded(
                  child: ReusableContainer(
                press: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                c: selectedGender == Gender.female
                    ? kActiveContainerColor
                    : kInactiveContainerColor,
                w: IconContent(
                  i: FontAwesomeIcons.female,
                  s: 'FEMALE',
                ),
              )),
            ],
          )),
          Expanded(
            flex: 1,
              child: ReusableContainer(
            c: kActiveContainerColor,
            w: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kSty),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kTxtNumStyle),
                      Text('CM', style: kSty),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableContainer(
                c: kActiveContainerColor,
                w: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT', style: kSty),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(weight.toString(), style: kTxtNumStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundCircleButton(
                          icon: FontAwesomeIcons.minus,
                          presss: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 15.0),
                        RoundCircleButton(
                          icon: FontAwesomeIcons.plus,
                          presss: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                )
              )),
              Expanded(
                  child: ReusableContainer(
                c: kActiveContainerColor,
                w: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: kSty),
                      Text(age.toString(), style: kTxtNumStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundCircleButton(
                            icon: FontAwesomeIcons.minus,
                            presss: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 15.0),
                          RoundCircleButton(
                            icon: FontAwesomeIcons.plus,
                            presss: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ],
          )),
          ReusableButton(
              t: 'CALCULATE',
              tap: () {
                CalculateBrain calc = CalculateBrain(height: height,weight: weight);


                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        ),
                    ),
                );
              })
        ],
      ),
    );
  }
}
