import 'package:aziq_tulik_jetkizw/app/vidjetter/appbar_icons_widget.dart';
import 'package:aziq_tulik_jetkizw/app/vidjetter/big_text_widget.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_dimensions.dart';
import 'package:aziq_tulik_jetkizw/common/quraldar/app_tusteri.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetailsView extends StatelessWidget {
  const RecommendedFoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                color: Colors.white,
                width: double.maxFinite,
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
        SliverToBoxAdapter(child: Text('Trying to pass a default value.' * 100))
      ],
    ));
  }
}
