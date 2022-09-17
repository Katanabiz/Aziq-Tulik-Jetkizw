import 'package:flutter/material.dart';

import '../../common/quraldar/app_dimensions.dart';

class SmalTextWidget extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  //final TextOverflow overFlow;
  final double height;
  const SmalTextWidget({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12,
    this.height = 1.2,
    //this.overFlow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        //   overflow: overFlow,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size == 0 ? Dimensions.font12 : size,
          color: color,
          height: height,
          fontWeight: FontWeight.w400,
        ));
  }
}

// This is reuseble text widget
// 34:35
