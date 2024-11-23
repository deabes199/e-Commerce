import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class CustomCircleContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const CustomCircleContainer({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(25),
        ),
        child: child,
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<FavoritesCubit>().addFavorite(product: product);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.favorite,
          color: context
                  .read<FavoritesCubit>()
                  .isProductInFavorites(product: product)
              ? Colors.red
              : Colors.grey,
        ),
      ),
    );
  }
}
