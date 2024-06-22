import 'package:flutter/material.dart';

class LocationTitle extends StatelessWidget {
  const LocationTitle(
      {super.key,
      required this.locationIcon,
      required this.iconColor,
      required this.locationTitle});

  final IconData locationIcon;
  final Color iconColor;
  final String locationTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          locationIcon,
          color: iconColor,
          size: 12,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(locationTitle)
      ],
    );
  }
}
