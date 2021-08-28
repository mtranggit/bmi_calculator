import 'package:bmi_calculator/code/app_const.dart';
import 'package:bmi_calculator/screens/input_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
      ),
      home: InputScreen(),
    );
  }
}
