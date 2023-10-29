import 'package:flutter/material.dart';
import 'constants.dart';
import 'ReusableCard.dart';
import 'bottom_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.bmiresult,
      required this.bmifeedback,
      required this.giveinstruction});

  final String bmiresult;
  final String bmifeedback;
  final String giveinstruction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kactivecolour,
          title: Text(
            bmiresult,
            style: kappbarstyle,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ReusableCard(
                colour: kactivecolour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bmifeedback,
                      style: TextStyle(
                          fontSize: 30.00, fontWeight: FontWeight.w900),
                    ),
                    Center(

                      child: Text(
                        giveinstruction,
                        style: TextStyle(

                            fontSize: 30.00, fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              textmsg: 'RE CALCULATE',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
