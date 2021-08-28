import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // return circleIconButtonFromCircleAvatar();
    // return circleIconButtonFromClipOval();
    // return circleIconButtonFromRawMaterialButton();
    return circleIconButtonFromElevatedButton();
  }

  Widget circleIconButtonFromRawMaterialButton() {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 0.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }

  Widget circleIconButtonFromElevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(18),
        primary: Color(0xFF4C4F5E),
      ),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }

  Widget circleIconButtonFromClipOval() {
    return ClipOval(
      child: Material(
        color: Color(0xFF4C4F5E),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }

  Widget circleIconButtonFromCircleAvatar() {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Color(0xFF4C4F5E),
      child: IconButton(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        iconSize: 25,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
