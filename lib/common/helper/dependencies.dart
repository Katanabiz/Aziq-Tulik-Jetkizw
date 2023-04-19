import 'package:aziq_tulik_jetkizw/common/api/api_client.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_constants.dart';
import 'package:get/get.dart';

import '../../app/controller/popular_product_controller.dart';
import '../../app/repository/popular_product_repo.dart';

Future<void> init() async {

  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUri));
  
  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // controller
  Get.lazyPut(()=> PopularProductController(popularProductRepo:Get.find()));
}
