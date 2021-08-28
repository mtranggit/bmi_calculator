import 'package:bmi_calculator/code/app_const.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultScreen({
    Key? key,
    required this.bmiResult,
    required this.resultText,
    this.interpretation = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: titleTextStyle,
                )),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: cardActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: bmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              label: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
