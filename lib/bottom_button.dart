import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'calculate_bmi.dart';
import 'input_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key, required this.textmsg,
    required this.onPress,
  });

  final String textmsg;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.pink,

      ),
      margin: const EdgeInsets.only(top: 10.00),
      height: 80.00,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ GestureDetector(
          onTap: onPress,
          child: Center(
              child: Text(textmsg,style: TextStyle(
                fontSize: 30.00,
                fontWeight: FontWeight.w800,
              ),)
          ),
        ),
        ],
      ),
    );
  }
}