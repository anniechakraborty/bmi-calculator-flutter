import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card_content.dart';

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
                    child: ReusableCard(
                      onPressingCard: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? activeReusableCardColour
                          : inactiveReusableCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        iconLabel: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPressingCard: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activeReusableCardColour
                          : inactiveReusableCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        iconLabel: 'FEMALE',
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
