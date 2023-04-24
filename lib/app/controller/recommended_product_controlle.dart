import 'package:get/get.dart';

import '../models/products_model.dart';
import '../repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  late final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({
    required this.recommendedProductRepo,
  });

  List<Products> _recommendedrProductList = [];
  List<Products> get recommendedProductList => _recommendedrProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();

    if (response.statusCode == 200) {
      _recommendedrProductList = [];
      _recommendedrProductList
          .addAll(ProductModel.fromJson(response.body).productList);
      _isLoaded = true;
      update();
    } else {}
  }
}
