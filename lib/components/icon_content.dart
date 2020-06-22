import 'package:flutter/material.dart';

import 'constants.dart';

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
          size: kIconHeight,
        ),
        SizedBox(
          height: kHeightOfSizedBox,
        ),
        Text(
          iconLabel,
          style: kIconLabelStyle,
        ),
      ],
    );
  }
}
