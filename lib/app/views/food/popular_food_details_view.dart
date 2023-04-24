import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aziq_tulik_jetkizw/app/routes/route_helper.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';

import '../../../common/quraldar/app_constants.dart';
import '../../../common/quraldar/app_tusteri.dart';
import '../../controller/popular_product_controller.dart';
import '../../vidjetter/app_column_widget.dart';
import '../../vidjetter/appbar_icons_widget.dart';
import '../../vidjetter/big_text_widget.dart';
import '../../vidjetter/expandable_text_widget.dart';

class PopularFoodDetailsView extends StatelessWidget {
  final int pageId;
 const  PopularFoodDetailsView({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
        Get.find<PopularProductController>().initProduct();
    print("What is page ID ${pageId.toString()}");
    print("Product name is");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // background image
        Positioned(
            left: 0,
            right: 0,
            child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImageSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "${AppConstants.baseUri}${AppConstants.uploadedtUri}${product.img!}"),
                )))),
        // both of icons
        Positioned(
          top: Dimensions.height45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesHelper.initial);
                },
                child: const AppbarIconwidget(icon: Icons.arrow_back_ios)),
            const AppbarIconwidget(icon: Icons.shopping_cart_outlined),
          ]),
        ),
        // introduction of foods
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimensions.popularFoodImageSize - 20,
          child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.height20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumnWidget(text: product.name!),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  const BigTextWidget(text: 'Introudis'),
                  SizedBox(
                    height: Dimensions.height20,
                  ),

                  // expandable text widget
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(text: product.description!),
                    ),
                  )
                ],
              )),
        ),
      ]),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller) {
        return Container(
          height: Dimensions.buttonHeightBar,
          padding: EdgeInsets.only(
              bottom: Dimensions.height30,
              top: Dimensions.height30,
              right: Dimensions.height20,
              left: Dimensions.height20),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(
                      bottom: Dimensions.height20,
                      top: Dimensions.height20,
                      right: Dimensions.height20,
                      left: Dimensions.height20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: Row(
                    children: [
                        GestureDetector(
                        onTap:() {
                          controller.setQuantity(false);
                        },
                        child:const Icon(Icons.remove, color: AppTusteri.signTus)),
                      SizedBox(
                        width: Dimensions.height10 / 2,
                      ),
                       BigTextWidget(text: controller.quantity.toString()),
                      SizedBox(
                        width: Dimensions.height10 / 2,
                      ),
                       GestureDetector(
                        onTap:() {
                          controller.setQuantity(true);
                        },
                        child:const Icon(Icons.add, color: AppTusteri.signTus))
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(
                    bottom: Dimensions.height20,
                    top: Dimensions.height20,
                    right: Dimensions.height20,
                    left: Dimensions.height20),
                decoration: BoxDecoration(
                    color: AppTusteri.negizigTus,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: BigTextWidget(
                    text: '\$${product.price!} | Add to cart',
                    color: Colors.white),
              )
            ],
          ));
      },)
    );
  }
}
