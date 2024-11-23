import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/products/ui/widgets/categories/category_bloc_builder.dart';
import 'package:hero_store_app/features/products/ui/widgets/product/product_bloc_builder.dart';
import 'package:hero_store_app/features/products/ui/widgets/product_tab_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(children: [
          const ProductTabBar(),
          vertcalSpace(20),
          const CategoryListBlocBuilder(),
          vertcalSpace(14),
          const ProductBlocBuilder()
        ]),
      ),
    ));
  }
}
