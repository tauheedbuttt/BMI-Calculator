import 'package:bmi_calc/components/bottom_button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import 'InputArguments.dart';

class OutputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final results =
        ModalRoute.of(context)!.settings.arguments as InputArguments;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReusableCard(
            child: Text(
              'Your Result',
              style: kHeadingStyle,
              textAlign: TextAlign.left,
            ),
            color: Color(0xFF1D2136),
          ),
          Expanded(
            child: ReusableCard(
              color: kMainColor,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      results.result.toUpperCase(),
                      style: kResultStyle,
                    ),
                    Text(
                      results.bmi,
                      style: kBmiStyle,
                    ),
                    Text(
                      'Normal BMI range:',
                      style: kNormalStyle,
                    ),
                    Text(
                      '18.5 - 25 kg/m2',
                      style: kParaStyle,
                    ),
                    Text(
                      results.msg,
                      style: kParaStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            text: "Calculate Again",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
