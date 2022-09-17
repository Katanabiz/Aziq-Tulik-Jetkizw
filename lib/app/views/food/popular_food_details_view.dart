import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../../common/quraldar/app_tusteri.dart';
import '../../vidjetter/app_column_widget.dart';
import '../../vidjetter/appbar_icons_widget.dart';
import '../../vidjetter/big_text_widget.dart';
import '../../vidjetter/expandable_text_widget.dart';
import '../../vidjetter/icons_and_text_widget.dart';
import '../../vidjetter/smal_text_widget.dart';

class PopularFoodDetailsView extends StatelessWidget {
  const PopularFoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // background image
        Positioned(
            left: 0,
            right: 0,
            child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImageSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/food0.png'))))),
        // both of icons
        Positioned(
          top: Dimensions.height45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppbarIconwidget(icon: Icons.arrow_back_ios),
                AppbarIconwidget(icon: Icons.shopping_cart_outlined),
              ]),
        ),
        // introduction of foods
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimensions.popularFoodImageSize - 20,
          child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.height20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumnWidget(
                    text: 'Malay Side',
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  const BigTextWidget(text: 'Introudis'),
                  SizedBox(
                    height: Dimensions.height20,
                  ),

                  // expandable text widget
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              "Trying to pass a default value for background color to the constructor but these are the error messages popping up Trying to pass a default value for background color to the constructor but these are the error messages popping up Trying to pass a default value for background color to the constructor but these are the error messages popping up Trying to pass a default value for background color to the constructor but these are the error messages popping up Trying to pass a default value for background color to the constructor but these are the error messages popping upTrying to pass a default value for background color to the constructor but these are the error messages popping up Trying to pass a default value for background color to the constructor but these are the error messages popping up ."),
                    ),
                  )
                ],
              )),
        ),
      ]),
      bottomNavigationBar: Container(
          height: Dimensions.buttonHeightBar,
          padding: EdgeInsets.only(
              bottom: Dimensions.height30,
              top: Dimensions.height30,
              right: Dimensions.height20,
              left: Dimensions.height20),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(
                      bottom: Dimensions.height20,
                      top: Dimensions.height20,
                      right: Dimensions.height20,
                      left: Dimensions.height20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: Row(
                    children: [
                      const Icon(Icons.remove, color: AppTusteri.signTus),
                      SizedBox(
                        width: Dimensions.height10 / 2,
                      ),
                      const BigTextWidget(text: '0'),
                      SizedBox(
                        width: Dimensions.height10 / 2,
                      ),
                      const Icon(Icons.add, color: AppTusteri.signTus)
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(
                    bottom: Dimensions.height20,
                    top: Dimensions.height20,
                    right: Dimensions.height20,
                    left: Dimensions.height20),
                decoration: BoxDecoration(
                    color: AppTusteri.negizigTus,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: const BigTextWidget(
                    text: '\$10 | Add to cart', color: Colors.white),
              )
            ],
          )),
    );
  }
}
