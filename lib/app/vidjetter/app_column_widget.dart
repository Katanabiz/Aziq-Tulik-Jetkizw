import 'package:aziq_tulik_jetkizw/app/vidjetter/smal_text_widget.dart';
import 'package:flutter/material.dart';

import '../../common/quraldar/app_dimensions.dart';
import '../../common/quraldar/app_tusteri.dart';
import 'big_text_widget.dart';
import 'icons_and_text_widget.dart';

class AppColumnWidget extends StatelessWidget {
  final String text;
  const AppColumnWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigTextWidget(text: text, size: Dimensions.font26),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
                children: List.generate(5,
                    // arrow means retun function
                    (index) {
              return Icon(Icons.star,
                  size: Dimensions.iconSzie18, color: AppTusteri.negizigTus);
            })),
            const SizedBox(width: 10),
            const SmalTextWidget(text: '4.5'),
            const SizedBox(width: 10),
            const SmalTextWidget(text: '1234'),
            const SizedBox(width: 10),
            const SmalTextWidget(text: 'Comments')
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconsAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppTusteri.belgisesiTus1),
            IconsAndTextWidget(
                icon: Icons.location_on,
                text: '1.7km',
                iconColor: AppTusteri.negizigTus),
            IconsAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32min',
                iconColor: AppTusteri.belgisesiTus2),
          ],
        )
      ],
    );
  }
}
