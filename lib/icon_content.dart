import 'package:flutter/material.dart';
import 'constants.dart';

class CardChild extends StatelessWidget {
  const CardChild({
    super.key, required this.icons, required this.label,
  });

  final IconData icons;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(
          icons,
          size: 70.0,
        ),
        SizedBox(height: 10.0),
        Text(label,style: kweightstyle,)
      ],
    );
  }
}