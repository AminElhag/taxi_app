import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';

class IconTitleButton extends StatelessWidget {
  const IconTitleButton({super.key, required this.statusIcon, required this.unit, required this.iconColor, required this.onPressed});
  final IconData statusIcon;
  final String unit;
  final Color iconColor;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child:Column(
        children: [
          Icon(statusIcon,color: iconColor,),
          const SizedBox(height: 8,),
          Text(unit),
        ],
      ),
    );
  }
}
