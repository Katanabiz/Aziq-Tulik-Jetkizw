import 'package:aziq_tulik_jetkizw/app/vidjetter/smal_text_widget.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:flutter/material.dart';

class IconsAndTextWidget extends StatelessWidget {
  const IconsAndTextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSzie24),
        const SizedBox(width: 5),
        SmalTextWidget(
          text: text,
        ),
      ],
    );
  }
}
