import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

class PersonalizedCardChild extends StatelessWidget {

  PersonalizedCardChild(this.genre);
  final String genre;

  IconData genreIcon() {
    if(genre=='MALE'){
      return FontAwesomeIcons.mars;
    } else{
      return FontAwesomeIcons.venus;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genreIcon(),
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          this.genre,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}