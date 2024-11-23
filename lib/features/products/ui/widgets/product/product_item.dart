import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_store_app/bloc_observer.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/widgets/custom_circle_container.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class ProductItems extends StatefulWidget {
  const ProductItems({super.key, required this.product});
  final Product product;

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  @override
  // void initState() {

  //   super.initState();
  //    context.read<ProductDetailsCubit>().getFavorites();
  // }
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
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.product.mainImage.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: FavoriteIcon(product: widget.product))
              ],
            ),
            vertcalSpace(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        widget.product.title ?? 'No',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$ ${widget.product.price.toString()}',
                        style: const TextStyle(
                            fontSize: 18, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset('assets/svg/add.svg')
              ],
            )
          ],
        );
      },
    );
  }
}
