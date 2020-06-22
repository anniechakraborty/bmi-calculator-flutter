import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/material.dart';

import '../components/bottomButton.dart';
import '../components/reusable_card_content.dart';

class HelloWorld extends StatelessWidget {
  final String category;
  final String bmiValue;
  final String description;
  HelloWorld(
      {@required this.category,
      @required this.bmiValue,
      @required this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI results',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
//              width: double.infinity,
              child: ReusableCard(
                colour: kActiveReusableCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      category,
                      style: kCategoryTextStyle,
                    ),
                    Text(
                      bmiValue,
                      style: kBMIValueTextStyle,
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: kDescriptionTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE - CALCULATE',
          )
        ],
      ),
    );
  }
}
