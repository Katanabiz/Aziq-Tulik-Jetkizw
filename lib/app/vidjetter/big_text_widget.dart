import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:flutter/material.dart';

class BigTextWidget extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overFlow;
  const BigTextWidget(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: overFlow,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size == 0 ? Dimensions.font20 : size,
          color: color,
          fontWeight: FontWeight.w400,
        ));
  }
}

// This is reuseble text widget
