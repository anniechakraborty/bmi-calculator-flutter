import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  ReusableCard({@required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color:
            colour, // as this is a default property of BoxDecoration widget, we cannot use it separately inside the Container widget.
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
