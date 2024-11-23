import 'package:flutter/material.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/home/ui/widgets/some_product/all_product_item.dart';

class AllProductGridView extends StatelessWidget {
  const AllProductGridView({
    super.key,
    required this.productList,
  });
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.productDetailScreen,
                  arguments: productList[index]);
            },
            child: AllProductItem(
              product: productList[index],
            ),
          );
        });
  }
}
