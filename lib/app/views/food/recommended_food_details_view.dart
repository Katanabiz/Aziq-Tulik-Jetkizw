import 'package:aziq_tulik_jetkizw/app/vidjetter/appbar_icons_widget.dart';
import 'package:aziq_tulik_jetkizw/app/vidjetter/big_text_widget.dart';
import 'package:aziq_tulik_jetkizw/app/vidjetter/expandable_text_widget.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetailsView extends StatelessWidget {
  const RecommendedFoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppbarIconwidget(icon: Icons.clear),
                AppbarIconwidget(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                  child: Center(
                      child: BigTextWidget(
                          text: 'Malay Side', size: Dimensions.font26)),
                )),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: AppTusteri.sariTus,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/food0.png',
                    width: double.maxFinite, fit: BoxFit.cover)),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandableTextWidget(
                    text: 'Trying to pass a default value.' * 100),
              ),
              const SizedBox(height: 20)
            ],
          )),
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              right: Dimensions.width20 * 2.5,
              left: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AppbarIconwidget(
              icon: Icons.remove,
              iconSize: Dimensions.iconSzie24,
              backgroundColor: AppTusteri.negizigTus,
              iconColor: Colors.white,
            ),
            BigTextWidget(
                text: '\$12.88 X 0',
                color: Colors.black,
                size: Dimensions.font26),
            AppbarIconwidget(
              icon: Icons.add,
              iconSize: Dimensions.iconSzie24,
              backgroundColor: AppTusteri.negizigTus,
              iconColor: Colors.white,
            ),
          ]),
        ),
        Container(
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
                  child:
                      const Icon(Icons.favorite, color: AppTusteri.negizigTus),
                ),
                Container(
                  padding: EdgeInsets.only(
                      bottom: Dimensions.height20,
                      top: Dimensions.height20,
                      right: Dimensions.height20,
                      left: Dimensions.height20),
                  decoration: BoxDecoration(
                      color: AppTusteri.negizigTus,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: const BigTextWidget(
                      text: '\$10 | Add to cart', color: Colors.white),
                )
              ],
            )),
      ]),
    );
  }
}
