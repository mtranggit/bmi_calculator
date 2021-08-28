import 'package:bmi_calculator/code/app_const.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const BottomButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: largeLabelTextStyle,
          ),
        ),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
