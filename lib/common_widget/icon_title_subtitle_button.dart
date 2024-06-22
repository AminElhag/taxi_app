import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';

class IconTitleSubtitleButton extends StatelessWidget {
  const IconTitleSubtitleButton({super.key, required this.statusIcon, required this.percentage, required this.unit, required this.iconColor, required this.onPressed});
  final IconData statusIcon;
  final String percentage;
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
          Text(percentage,style: const TextStyle(fontWeight: FontWeight.w900),),
          Text(unit),
        ],
      ),
    );
  }
}
