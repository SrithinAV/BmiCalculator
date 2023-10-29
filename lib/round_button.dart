import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.child, required this.onPress});

  final IconData child;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        child,
      ),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints().tighten(
        width: 56.00,
        height: 56.00,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
