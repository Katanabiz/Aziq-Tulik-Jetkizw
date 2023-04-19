import 'package:aziq_tulik_jetkizw/app/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';

import 'app/views/food/popular_food_details_view.dart';
import 'app/views/food/recommended_food_details_view.dart';
import 'app/views/uy/main_food_view.dart';
import 'package:get/get.dart';
import 'common/helper/dependencies.dart' as repo;

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await repo.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const MianFoodView()
            // const  RecommendedFoodDetailsView() // const PopularFoodDetailsView(),
        );
  }
}
// 3:23:36
