import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'round_button.dart';
import 'result_screen.dart';
import 'calculate_bmi.dart';
import 'bottom_button.dart';

enum Gender { male, female }

int height = 120;
int weight = 60;
int age = 14;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor = kinactivecolour;
  Color femalecardcolor = kinactivecolour;
  Gender? selectgender;

  void minus() {
    setState(() {
      weight--;
    });
  }

  void plus() {
    setState(() {
      weight++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator',style:kappbarstyle),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectgender = Gender.male;
                        });
                      },
                      colour: selectgender == Gender.male
                          ? kactivecolour
                          : kinactivecolour,
                      cardchild: const CardChild(
                          icons: FontAwesomeIcons.mars, label: 'Male'),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectgender = Gender.female;
                          });
                        },
                        child: ReusableCard(
                          colour: selectgender == Gender.female
                              ? kactivecolour
                              : kinactivecolour,
                          cardchild: const CardChild(
                            icons: FontAwesomeIcons.venus,
                            label: 'Female',
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Color(0XFF1D1E33),
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'HEIGHT',
                      style: kweightstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: kheightstyle,
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 25.00,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.00,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xfff51780),
                        inactiveTrackColor: Color(0xff646d73),
                        thumbColor: Color(0xffc40454),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 13.00),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 26.00),
                        overlayColor: Color(0x8cee78a8),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 240,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        colour: Color(0XFF1D1E33),
                        cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: kweightstyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kheightstyle,
                            ),
                            const SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  child: FontAwesomeIcons.minus,
                                  onPress: minus,
                                ),
                                const SizedBox(
                                  width: 10.00,
                                ),
                                RoundIconButton(
                                  child: FontAwesomeIcons.plus,
                                  onPress: plus,
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                              colour: Color(0XFF1D1E33),
                              cardchild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'AGE',
                                    style: kweightstyle,
                                  ),
                                  Text(
                                    age.toString(),
                                    style: kheightstyle,
                                  ),
                                  const SizedBox(height: 15.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                        child: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            if (age > 1) {
                                              age--;
                                            } else
                                              age = 1;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10.00,
                                      ),
                                      RoundIconButton(
                                        child: FontAwesomeIcons.plus,
                                        onPress: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(textmsg: 'CALCULATE',onPress: ()
            {
              CalculateBmi calc = CalculateBmi(weight: weight, height: height);

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultScreen(
                  bmiresult: calc.calcuate_bmi(),
                  bmifeedback: calc.check_bmi(),
                  giveinstruction: calc.giveinstruct(),
                );
              },),);
            },),
          ],
        ));
  }
}


