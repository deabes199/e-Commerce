import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class WishlistListView extends StatelessWidget {
  const WishlistListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return context.read<FavoritesCubit>().favorites.isEmpty
            ? Column(
                children: [
                  vertcalSpace(100),
                  Image.asset('assets/images/aa.jpg')
                ],
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: context.read<FavoritesCubit>().favorites.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return WishlistItems(
                        product:
                            context.read<FavoritesCubit>().favorites[index],
                      );
                    }));
      },
    );
  }
}

class WishlistItems extends StatelessWidget {
  final Product product;
  const WishlistItems({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: Container(
            width: double.infinity,
            height: 110.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.mainImage.toString(),
                    fit: BoxFit.cover,
                    width: 115.w,
                    height: 115.h,
                  ),
                ),
                horzintalSpace(10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(product.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyles.font18BlackBold
                                    .copyWith(fontSize: 16.sp)),
                          ),
                          horzintalSpace(10),
                          InkWell(
                              onTap: () {
                                context
                                    .read<FavoritesCubit>()
                                    .removeFavorite(product: product);
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      vertcalSpace(7),
                      Text(
                        product.category ?? '',
                        style: TextStyles.font16GrayNormal,
                      ),
                      vertcalSpace(7),
                      Text(
                        '\$ ${product.price}',
                        style: TextStyles.font18primaryBold,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
