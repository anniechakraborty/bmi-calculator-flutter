import 'package:bmi_calculator/calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottomButton.dart';
import '../components/constants.dart';
import '../components/icon_content.dart';
import '../components/reusable_card_content.dart';
import '../components/round _card_buttons.dart';
import 'results_page.dart';

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
  int weight = 40;
  int age = 13;
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kIconLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundCardButton(
                                buttonChild: FontAwesomeIcons.minus,
                                update: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundCardButton(
                                buttonChild: FontAwesomeIcons.plus,
                                update: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveReusableCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kIconLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundCardButton(
                                buttonChild: FontAwesomeIcons.minus,
                                update: () {
                                  setState(() {
                                    age = age - 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundCardButton(
                                buttonChild: FontAwesomeIcons.plus,
                                update: () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ), //ROW 3
            BottomButton(
              onPress: () {
                CalculateBMI obj = CalculateBMI(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelloWorld(
                      bmiValue: obj.calc(),
                      description: obj.getDescription(),
                      category: obj.getCategory(),
                    ),
                  ),
                );
              },
              buttonTitle: 'CALCULATE',
            ),
          ],
        ));
  }
}
