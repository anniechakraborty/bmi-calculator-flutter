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
  int height = 155;
  @override
  Widget build(BuildContext context) {
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
                    child: ReusableCard(
                      onPressingCard: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveReusableCardColour
                          : kInactiveReusableCardColour,
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
                          ? kActiveReusableCardColour
                          : kInactiveReusableCardColour,
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
              child: ReusableCard(
                colour: kActiveReusableCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kIconLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kIconLabelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTickMarkColor: Colors.white,
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayColor: Color(0x29EB1555),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 25.0,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        max: kMaxHumanHeight,
                        min: kMinHumanHeight,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ), //ROW 2
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveReusableCardColour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveReusableCardColour,
                    ),
                  ),
                ],
              ),
            ), //ROW 3
            Container(
              color: kBottomBarColour,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              width: double.infinity,
              height: kBottomBarHeight,
              child: Center(
                child: kBottomBarText,
              ),
            ) //BOTTOM BAR
          ],
        ));
  }
}
