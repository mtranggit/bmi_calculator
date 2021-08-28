import 'package:bmi_calculator/app_const.dart';
import 'package:bmi_calculator/gender_icon.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      child: GenderIcon(
                        gender: Gender.male,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      child: GenderIcon(
                        gender: Gender.female,
                        label: 'FEMALE',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(),
                  ),
                  Expanded(
                    child: ReusableCard(),
                  )
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}
