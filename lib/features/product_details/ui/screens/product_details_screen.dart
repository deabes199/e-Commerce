import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/add_to_cart_button.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/reviews_list_view.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/product_description.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/product_image.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/product_title_and_price.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageDetails(
                product: product,
                image: product.mainImage ?? '',
              ),
              vertcalSpace(20),
              ProductTitleAndPrice(
             product: product,
              ),
              vertcalSpace(10),
               AddToCartButton(product: product,),
              vertcalSpace(20),
              ProductDecription(
                description: product.description ?? '',
              ),
              vertcalSpace(20),
              ReviewsProduct(
                product: product,
              )
            ],
          ),
        ),
      ),
    );
  }
}
