import 'package:aziq_tulik_jetkizw/app/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxService{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> popularProductList = [];
}