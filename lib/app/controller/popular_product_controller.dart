import 'dart:convert';

import 'package:aziq_tulik_jetkizw/app/repository/popular_product_repo.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<Products> _popularProductList = [];
  List<Products> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Get products");
      _popularProductList = [];
      _popularProductList
          .addAll(ProductModel.fromJson(response.body).productList);

      _isLoaded = true;
      update();
    } else {
      "Cuold not reach product list items";
    }
  }

  void setQuantity(isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("Quantity$_quantity");
    }
    update();
  }

  int checkQuantity(int quantityLocal) {
    if (quantityLocal < 0) {
      Get.snackbar("Item count", "You can't reduce more!",
      backgroundColor: AppTusteri.negizigTus,
      colorText: Colors.white
      );
      return 0;
    } else if (quantityLocal > 20) {
       Get.snackbar("Item count", "You can't add more!",
      backgroundColor: AppTusteri.negizigTus,
      colorText: Colors.white
      );
      return 20;
    } else {
      return quantityLocal;
    }
  }

  void initProduct(){
    _quantity = 0;
  }
}
