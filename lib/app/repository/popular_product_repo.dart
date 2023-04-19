import 'package:aziq_tulik_jetkizw/common/quraldar/app_constants.dart';
import 'package:get/get.dart';

import '../../common/api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.popularProductUri);
  }
}
