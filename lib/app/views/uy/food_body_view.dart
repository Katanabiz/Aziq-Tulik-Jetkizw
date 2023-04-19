import 'package:aziq_tulik_jetkizw/app/controller/popular_product_controller.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_constants.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/products_model.dart';
import '../../vidjetter/app_column_widget.dart';
import '../../vidjetter/icons_and_text_widget.dart';
import '../../vidjetter/smal_text_widget.dart';
import '../../vidjetter/big_text_widget.dart';

class FoodBodyView extends StatefulWidget {
  const FoodBodyView({Key? key}) : super(key: key);

  @override
  State<FoodBodyView> createState() => _FoodBodyViewState();
}

class _FoodBodyViewState extends State<FoodBodyView> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var currentPageValue = 0.0;
  double scallFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState;
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // slaider section
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return SizedBox(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, index) {
                  return _pageItemBuild(index, popularProducts.popularProductList[index]);
                }));
      }),
      // dots
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty
              ? 1
              : popularProducts.popularProductList.length,
          position: currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppTusteri.negizigTus,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        );
      }),

      // popular text
      SizedBox(
        height: Dimensions.height30,
      ),
      Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigTextWidget(text: 'Popular'),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: const BigTextWidget(text: '.', color: Colors.black26)),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: const SmalTextWidget(
                  text: 'Food pairing',
                ),
              )
            ],
          )),
      // List food and images
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (contect, index) {
            return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    // Image section
                    Container(
                        width: Dimensions.listViewImgeSize,
                        height: Dimensions.listViewImgeSize,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/food0.png')),
                        )),
                    // Text container
                    Expanded(
                      child: Container(
                          height: Dimensions.listViewTextContainerSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20)),
                            color: Colors.white,
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const BigTextWidget(
                                      text: 'Nutuirous furit meal in china'),
                                  SizedBox(height: Dimensions.height10),
                                  const SmalTextWidget(
                                      text: 'With chines charactirects'),
                                  SizedBox(height: Dimensions.height10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      IconsAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: 'Normal',
                                          iconColor: AppTusteri.belgisesiTus1),
                                      IconsAndTextWidget(
                                          icon: Icons.location_on,
                                          text: '1.7km',
                                          iconColor: AppTusteri.negizigTus),
                                      IconsAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text: '32min',
                                          iconColor: AppTusteri.belgisesiTus2),
                                    ],
                                  )
                                ],
                              ))),
                    ),
                  ],
                ));
          })
    ]);
  }

  Widget _pageItemBuild(int index, Products popularPro) {
    Matrix4 matrix = Matrix4.identity();

    if (index == currentPageValue.floor()) {
      var currentScal = 1 - (currentPageValue - index) * (1 - scallFactor);
      var currenTransform = height * (1 - currentScal) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScal, 1)
        ..setTranslationRaw(0, currenTransform, 0);
    } else if (index == currentPageValue.floor() + 1) {
      var currentScal =
          scallFactor + (currentPageValue - index + 1) * (1 - scallFactor);
      var currenTransform = height * (1 - currentScal) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScal, 1)
        ..setTranslationRaw(0, currenTransform, 0);
    } else if (index == currentPageValue.floor() - 1) {
      var currentScal = 1 - (currentPageValue - index) * (1 - scallFactor);
      var currenTransform = height * (1 - currentScal) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScal, 1)
        ..setTranslationRaw(0, currenTransform, 0);
    } else {
      var currentScal = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScal, 1)
        ..setTranslationRaw(0, height * (1 - scallFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven
                  ? const Color(0xff69c5df)
                  : const Color(0xff9294cc),
              image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage( "${AppConstants.baseUri}/uploads${popularPro.img!}"),
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0XFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15, left: 15, right: 15),
                  child:  AppColumnWidget(text: popularPro.name!))),
        )
      ]),
    );
  }
}
