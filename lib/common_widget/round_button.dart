import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.title, required this.onPressed, required this.backgroundColor});

  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.maxFinite,
      elevation: 0,
      color: backgroundColor,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: TColor.primaryText,
          fontSize: 16,
        ),
      ),
    );
  }
}
