import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String buttonTitle;
  BottomButton({@required this.onPress, this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomBarColour,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        width: double.infinity,
        height: kBottomBarHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: kBottomBarTextStyle,
          ),
        ),
      ),
    );
  }
}
