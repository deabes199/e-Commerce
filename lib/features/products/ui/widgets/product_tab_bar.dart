import 'package:flutter/material.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/widgets/custom_tab_bar_widget.dart';

class ProductTabBar extends StatelessWidget {
  const ProductTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabBarWidget(
        title: 'Products',
        widget: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.searchScreen);
            },
            icon: Icon(
              Icons.search,
              size: 24,
            )));
  }
}