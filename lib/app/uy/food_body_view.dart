import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
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
  double height = 220.0;

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
    return Container(
        color: Colors.redAccent,
        height: 320,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _pageItemBuild(index);
            }));
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
            height: 220,
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
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Container(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BigTextWidget(text: 'Malay Side'),
                      const SizedBox(
                        height: 10,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          IconsAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: 'Normal',
                              iconColor: AppTusteri.belgisesiTus1),
                          IconsAndTextWidget(
                              icon: Icons.location_on,
                              text: '1.7km',
                              iconColor: AppTusteri.matinTus),
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
