import 'package:aziq_tulik_jetkizw/app/views/food/popular_food_details_view.dart';
import 'package:aziq_tulik_jetkizw/app/views/food/recommended_food_details_view.dart';
import 'package:get/get.dart';

import '../views/uy/main_food_view.dart';

class RoutesHelper {
  static const String initial = "/";
  static const String popularFood = "/popular_food";
  static const String recommendedFood = "/recommended_food";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood ? pageId = $pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood ? pageId = $pageId';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () {
        return const MianFoodView();
      },
    ),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetailsView(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return  RecommendedFoodDetailsView(pageId: int.parse(pageId!));
        },
        transition: Transition.fade),
  ];
}
