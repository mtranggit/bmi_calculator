import 'package:flutter/material.dart';

enum Gender { male, female }

class GenderIcon extends StatelessWidget {
  final String label;
  final Gender gender;

  const GenderIcon({
    Key? key,
    this.gender = Gender.male,
    this.label = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.gender == Gender.male ? Icons.male : Icons.female,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label),
      ],
    );
  }
}
