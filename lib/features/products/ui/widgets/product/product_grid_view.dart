import 'package:flutter/material.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/products/ui/widgets/product/product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.productList});
  final ProductModel productList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: productList.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.productDetailScreen,
                      arguments: productList.products[index]);
                },
                child: ProductItems(
                  product: productList.products[index],
                ));
          }),
    );
  }
}
