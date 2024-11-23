import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_store_app/core/di/dependancy_injection.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/core/widgets/custom_circle_container.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class AllProductItem extends StatelessWidget {
  const AllProductItem({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.grayColor,
                        )),
                    height: 180.h,
                    width: 180.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        product.mainImage ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: FavoriteIcon(product: product),
                )
              ],
            ),
            vertcalSpace(6),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          product.title ?? '',
                          // style: TextStyles.font18BlackBold
                          //     .copyWith(fontSize: 16)
                        ),
                        Flexible(
                          child: Text('\$ ${product.price.toString()}',
                              style: TextStyles.font18primaryBold
                                  .copyWith(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset('assets/svg/add.svg')
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
