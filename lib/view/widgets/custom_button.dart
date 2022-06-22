import 'package:flutter/material.dart';

class custom_button extends StatelessWidget {
  VoidCallback? onPressed;
  Widget? child;
  Color? textColor;
  Color? backgroundColor;

  custom_button({
    this.onPressed,
    this.child,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      onPressed: onPressed,
      child: child,
      textColor: textColor,
      color: Colors.teal,
    );
  }


}
