import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class Results extends StatelessWidget {

  final String results;
  final String bmi;
  final String interpretations;

  const Results(this.results, this.bmi, this.interpretations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'YOUR RESULT',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Color(kActiveCardColour),
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    results,
                    style: kTextStyleResultsStatusOverweight,
                  ),
                  Text(
                    bmi,
                    style: kBMINumbers,
                  ),
                  Text(
                    interpretations,
                    style: kBMIInterpretation,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Container(
              width: kDoubleInfinity,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLabelTextBottomStyle,
                ),
              ),
              height: 80,
              margin: EdgeInsets.only(top: 10),
              color: Color(kBottomContainercolor),
            ),
          )
        ],
      ),
    );
  }
}
