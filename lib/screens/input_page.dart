import 'package:bmi_calculator/components/personalized_child_card.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/rounded_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Genders { male, female }

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders actualGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  void updateColor(Genders sex) {
    actualGender = sex;
  }

  @override
  Widget build(BuildContext context) {
    CalculatorBrain args = ModalRoute.of(context).settings.arguments;
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
                    flex: 2,
                    child: ReusableCard(
                      colour: Color(actualGender == Genders.male
                          ? kActiveCardColour
                          : kInactiveCardColour),
                      cardChild: PersonalizedCardChild('MALE'),
                      onTapFunction: () {
                        setState(() {
                          updateColor(Genders.male);
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ReusableCard(
                      colour: Color(actualGender == Genders.female
                          ? kActiveCardColour
                          : kInactiveCardColour),
                      cardChild: PersonalizedCardChild('FEMALE'),
                      onTapFunction: () {
                        setState(() {
                          updateColor(Genders.female);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Color(kActiveCardColour),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kLabelNumberStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xff8d8e98),
                        overlayColor: Color(0x1FEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: Color(kBottomContainercolor),
                        activeTrackColor: Colors.white,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (v) {
                          setState(() {
                            height = v.toInt();
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
                    flex: 2,
                    child: ReusableCard(
                      colour: Color(kActiveCardColour),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kLabelNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                  Icon(FontAwesomeIcons.plus,
                                      color: Colors.white), () {
                                setState(() {
                                  weight++;
                                });
                              }),
                              SizedBox(
                                width: 15,
                              ),
                              RoundedIconButton(
                                  Icon(FontAwesomeIcons.minus,
                                      color: Colors.white), () {
                                setState(() {
                                  weight--;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ReusableCard(
                      colour: Color(kActiveCardColour),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kLabelNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                  Icon(FontAwesomeIcons.plus,
                                      color: Colors.white), () {
                                setState(() {
                                  age++;
                                });
                              }),
                              SizedBox(
                                width: 15,
                              ),
                              RoundedIconButton(
                                  Icon(FontAwesomeIcons.minus,
                                      color: Colors.white), () {
                                setState(() {
                                  age--;
                                });
                              })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain cb=CalculatorBrain(weight, height);
                Navigator.pushNamed(context, '/results', arguments: Results(cb.getBMIResults(), cb.calculateBMI(), cb.getBMIInterpretation()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: kLabelTextBottomStyle,
                  ),
                ),
                height: 80,
                margin: EdgeInsets.only(top: 10),
                //padding: EdgeInsets.only(bottom: 20),
                color: Color(kBottomContainercolor),
                width: kDoubleInfinity,
              ),
            ),
          ],
        ));
  }
}


