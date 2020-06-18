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

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCard = inactiveReusableCardColour;
  Color femaleCard = inactiveReusableCardColour;

//  we will change the background colour of the gender cards based on the entered gender
//  1 - male, 2- female

  void updateCardColour(int gender) {
    if (gender == 1) {
      if (maleCard == inactiveReusableCardColour) {
        maleCard = activeReusableCardColour;
        femaleCard = inactiveReusableCardColour;
      } else {
        maleCard = inactiveReusableCardColour;
      }
    }
    if (gender == 2) {
      {
        if (femaleCard == inactiveReusableCardColour) {
          femaleCard = activeReusableCardColour;
          maleCard = inactiveReusableCardColour;
        } else {
          femaleCard = inactiveReusableCardColour;
        }
      }
    }
  }

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
                          updateCardColour(1);
                        });
                      },
                      child: ReusableCard(
                        colour: maleCard,
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
                          updateCardColour(2);
                        });
                      },
                      child: ReusableCard(
                        colour: femaleCard,
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
