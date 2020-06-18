import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const double heightOfSizedBox = 10.0;
const double iconHeight = 55.0;
const iconLabelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  final IconData icon;
  final String iconLabel;
  IconContent({@required this.icon, @required this.iconLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconHeight,
        ),
        SizedBox(
          height: heightOfSizedBox,
        ),
        Text(
          iconLabel,
          style: iconLabelStyle,
        ),
      ],
    );
  }
}
