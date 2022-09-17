import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppbarIconwidget extends StatelessWidget {
  const AppbarIconwidget(
      {super.key,
      required this.icon,
      this.backgroundColor = const Color(0XFFfcf4e4),
      this.iconColor = const Color(0XFF756d54),
      this.size = 40});

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 2),
            color: backgroundColor),
        child: Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSzie16,
        ));
  }
}
