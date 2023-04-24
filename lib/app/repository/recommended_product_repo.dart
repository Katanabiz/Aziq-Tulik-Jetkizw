import 'package:aziq_tulik_jetkizw/common/api/api_client.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList()async{
    return await apiClient.getData(AppConstants.recommenedProductUri);
  }
}