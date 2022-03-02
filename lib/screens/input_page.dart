import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/reusable_icon.dart';
import '../components/widget_with_label.dart';
import '../components/circle_icon_button.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calc/brain.dart';
import 'InputArguments.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 70;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.Male
                        ? kActiveColor
                        : kInActiveColor,
                    child: ReusableIcon(
                      icon: FontAwesomeIcons.male,
                      caption: 'MALE',
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.Female
                        ? kActiveColor
                        : kInActiveColor,
                    child: ReusableIcon(
                      icon: FontAwesomeIcons.female,
                      caption: 'FEMALE',
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kMainColor,
              child: WidgetWithLabel(
                label: 'HEIGHT',
                value: height,
                subscript: 'cm',
                widget: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: kActiveColor,
                    activeTrackColor: kBottomContainerColor,
                    thumbColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                    overlayColor: Color(0x29FFFFFF),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kMainColor,
                    child: WidgetWithLabel(
                      label: 'WEIGHT',
                      value: weight,
                      subscript: 'kg',
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleIconButton(
                            icon: FontAwesomeIcons.plus,
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          CircleIconButton(
                            icon: FontAwesomeIcons.minus,
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kMainColor,
                    child: WidgetWithLabel(
                      label: 'AGE',
                      value: age,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleIconButton(
                            icon: FontAwesomeIcons.plus,
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          CircleIconButton(
                            icon: FontAwesomeIcons.minus,
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: "CALCULATE",
            onTap: () {
              Brain brain = Brain(weight: weight, height: height);
              Navigator.pushNamed(
                context,
                '/output',
                arguments: InputArguments(
                  result: brain.getResult(),
                  bmi: brain.getBMI(),
                  msg: brain.getInterpretation(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
