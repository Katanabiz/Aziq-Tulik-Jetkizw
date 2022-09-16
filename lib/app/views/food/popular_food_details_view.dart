import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:flutter/material.dart';

class PopularFoodDetailsView extends StatelessWidget {
  const PopularFoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImageSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/food0.png')))))
      ]),
    );
  }
}
