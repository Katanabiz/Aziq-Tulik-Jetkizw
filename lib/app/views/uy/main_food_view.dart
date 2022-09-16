import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
import 'package:flutter/material.dart';

import '../../vidjetter/smal_text_widget.dart';
import '../../vidjetter/big_text_widget.dart';
import 'food_body_view.dart';

class MianFoodView extends StatefulWidget {
  const MianFoodView({Key? key}) : super(key: key);

  @override
  State<MianFoodView> createState() => _MianFoodViewState();
}

class _MianFoodViewState extends State<MianFoodView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            margin: EdgeInsets.only(
                bottom: Dimensions.height15, top: Dimensions.height45),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const BigTextWidget(
                        text: "Kazakhstan",
                        color: AppTusteri.negizigTus,
                      ),
                      Row(
                        children: const [
                          SmalTextWidget(text: "Alamty", color: Colors.black54),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppTusteri.negizigTus),
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimensions.iconSzie24),
                    ),
                  )
                ])),
        const Expanded(
            child: SingleChildScrollView(
          child: FoodBodyView(),
        ))
      ],
    ));
  }
}
