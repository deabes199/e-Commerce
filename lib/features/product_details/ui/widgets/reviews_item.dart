import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.product, required this.index});
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              child: Icon(
                Icons.person,
                color: Colors.grey.shade300,
              ),
            ),
            horzintalSpace(5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: product.reviews[index].reviewerName,
                          style: TextStyles.font14BlackNormal),
                      TextSpan(
                          text: '(⭐ ${product.reviews[index].rating})',
                          style: TextStyles.font18primaryBold
                              .copyWith(fontSize: 15)),
                    ],
                  ),
                ),
                vertcalSpace(6),
                Text(product.reviews[index].date,
                    style: TextStyles.font16GrayNormal
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
        vertcalSpace(6),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: '  Comment : ',
                  style: TextStyles.font18primaryBold.copyWith(fontSize: 16)),
              TextSpan(
                text: product.reviews[index].comment,
                style: TextStyles.font18BlackBold.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
