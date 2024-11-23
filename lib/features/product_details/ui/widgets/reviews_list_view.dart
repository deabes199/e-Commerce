import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/reviews_item.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class ReviewsProduct extends StatelessWidget {
  const ReviewsProduct({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews',
            style:TextStyles.font20BlackBold,
          ),
          vertcalSpace(10),
          SizedBox(
            height: 400,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return vertcalSpace(16);
              },
              itemCount: product.reviews.length,
              itemBuilder: (context, index) {
                return ReviewItem(
                  product: product,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}