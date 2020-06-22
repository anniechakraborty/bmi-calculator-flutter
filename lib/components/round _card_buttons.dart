import 'package:flutter/material.dart';

class RoundCardButton extends StatelessWidget {
  final IconData buttonChild;
  final Function update;
  RoundCardButton({@required this.buttonChild, this.update});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: update,
      child: Icon(
        buttonChild,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 47.0,
        height: 47.0,
      ),
    );
  }
}
