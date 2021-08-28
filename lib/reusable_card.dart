import 'package:flutter/material.dart';

import 'app_const.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  const ReusableCard({
    Key? key,
    // required this.color,
    this.color = cardActiveColor,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
