
import 'package:flutter/material.dart';

class IconsAndTextWidget extends StatelessWidget {
  const IconsAndTextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

    final IconData icon;
    final String text;
    final Color color;
    final Color iconColor;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
      ],
    );
  }
}
