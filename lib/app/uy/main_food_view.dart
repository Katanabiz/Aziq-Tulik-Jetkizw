import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
import 'package:flutter/material.dart';

import '../vidjetter/smal_text_widget.dart';
import '../vidjetter/big_text_widget.dart';
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
            margin: const EdgeInsets.only(bottom: 15, top: 45),
            padding: const EdgeInsets.only(left: 20, right: 20),
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
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppTusteri.negizigTus),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  )
                ])),
        const FoodBodyView()
      ],
    ));
  }
}
//52:34