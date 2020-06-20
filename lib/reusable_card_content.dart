import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPressingCard;
  ReusableCard({@required this.colour, this.cardChild, this.onPressingCard});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressingCard,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color:
              colour, // as this is a default property of BoxDecoration widget, we cannot use it separately inside the Container widget.
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
