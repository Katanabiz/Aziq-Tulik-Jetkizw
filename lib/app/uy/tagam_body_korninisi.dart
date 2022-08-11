import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
import 'package:flutter/material.dart';

import '../vidjetter/ulken_matin_vidjet.dart';

class TgamBodyKorninsi extends StatefulWidget {
  const TgamBodyKorninsi({Key? key}) : super(key: key);

  @override
  State<TgamBodyKorninsi> createState() => _TgamBodyKorninsiState();
}

class _TgamBodyKorninsiState extends State<TgamBodyKorninsi> {
  PageController pageController = PageController(viewportFraction: 0.85);
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
    return Stack(children: [
      Container(
          height: 220,
          margin: const EdgeInsets.only(left: 5, right: 5),
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
            height: 140,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UlkenMatinVidjet(text: 'Malay Side'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                            children: List.generate(
                                5,
                                // arrow means retun function
                                (index) => const Icon(Icons.star,
                                    color: AppTusteri.negizigTus)))
                      ],
                    )
                  ],
                ))),
      )
    ]);
  }
}
