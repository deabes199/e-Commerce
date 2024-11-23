import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class ProductTitleAndPrice extends StatelessWidget {
  const ProductTitleAndPrice({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                vertcalSpace(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/svg/star.svg'),
                    horzintalSpace(7),
                    Text(product.rating.toString(),
                        style: TextStyles.font20BlackBold),
                    horzintalSpace(7),
                    Text(('( ${product.reviews.length}  Review )'),
                        style: TextStyles.font16GrayNormal),
                  ],
                ),
                vertcalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        product.category ?? '',
                        style: TextStyles.font18BlackBold
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        'Avilable in stock ( ${product.stock.toString()} )',
                        style:
                            TextStyles.font18BlackBold.copyWith(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Text(
            '${product.price.toString()}\$',
            style: TextStyles.font18primaryBold,
          )
        ],
      ),
    );
  }
}
