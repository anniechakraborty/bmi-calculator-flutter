import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card_content.dart';

const double bottomBarHeight = 55.0;
const Color activeReusableCardColour = Color(0xFF1D1E33);
const Color inactiveReusableCardColour = Color(0xFF111328);
const Color bottomBarColour = Color(0xFFEB1555);

const bottomBarText = Text(
  'CALCULATE',
  style: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  ),
);

enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? activeReusableCardColour
                            : inactiveReusableCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          iconLabel: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? activeReusableCardColour
                            : inactiveReusableCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          iconLabel: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), //ROW 1
            Expanded(
              child: ReusableCard(colour: activeReusableCardColour),
            ), //ROW 2
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeReusableCardColour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeReusableCardColour,
                    ),
                  ),
                ],
              ),
            ), //ROW 3
            Container(
              color: bottomBarColour,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              width: double.infinity,
              height: bottomBarHeight,
              child: Center(
                child: bottomBarText,
              ),
            ) //BOTTOM BAR
          ],
        ));
  }
}
