import 'package:flutter/material.dart';

import 'app/views/food/popular_food_details_view.dart';
import 'app/views/food/recommended_food_details_view.dart';
import 'app/views/uy/main_food_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            const RecommendedFoodDetailsView() // const PopularFoodDetailsView(), //const MianFoodView()
        );
  }
}
// 3:23:36
