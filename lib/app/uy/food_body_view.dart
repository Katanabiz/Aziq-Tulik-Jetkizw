import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../vidjetter/icons_and_text_widget.dart';
import '../vidjetter/smal_text_widget.dart';
import '../vidjetter/big_text_widget.dart';

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
      SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _pageItemBuild(index);
              })),
      DotsIndicator(
        dotsCount: 5,
        position: currentPageValue,
        decorator: DotsDecorator(
          activeColor: AppTusteri.negizigTus,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    ]);
  }

  Widget _pageItemBuild(int index) {
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
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xff69c5df)
                  : const Color(0xff9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/food0.png'),
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BigTextWidget(text: 'Malay Side'),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(5,
                                  // arrow means retun function
                                  (index) {
                            return const Icon(Icons.star,
                                size: 20, color: AppTusteri.negizigTus);
                          })),
                          const SizedBox(width: 10),
                          const SmalTextWidget(text: '4.5'),
                          const SizedBox(width: 10),
                          const SmalTextWidget(text: '1234'),
                          const SizedBox(width: 10),
                          const SmalTextWidget(text: 'Comments')
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        )
      ]),
    );
  }
}
