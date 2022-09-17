import 'package:aziq_tulik_jetkizw/app/vidjetter/smal_text_widget.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmalTextWidget(
              text: firstHalf,
              size: Dimensions.font16,
              color: AppTusteri.paraTus)
          : Column(children: [
              SmalTextWidget(
                  text:
                      hiddenText ? ('$firstHalf...') : (firstHalf + secondHalf),
                  size: Dimensions.font16,
                  color: AppTusteri.paraTus,
                  height: 1.8),
              InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      const SmalTextWidget(
                          text: 'Show more', color: AppTusteri.negizigTus),
                      Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppTusteri.negizigTus)
                    ],
                  ))
            ]),
    );
  }
}
