import 'package:flutter/material.dart';

import 'app_const.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final VoidCallback? onPressed;
  // final Function()? onPress;
  const ReusableCard({
    Key? key,
    // required this.color,
    this.color = cardActiveColor,
    this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

/**
 * 
 * With null safety:

Instead of

final Function? onPressed;
use

final VoidCallback? onPressed;

or

final Function()? onPressed;
 */