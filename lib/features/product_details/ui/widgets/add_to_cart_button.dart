import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/widgets/app_custom_button.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCartsCubit, AddCartsState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppCustomButton(
              height: 50,
              width: 200,
              color: context
                      .read<AddCartsCubit>()
                      .isProductInCart(product: product)
                  ? AppColors.lightGray
                  : AppColors.primaryColor,
              label: context
                      .read<AddCartsCubit>()
                      .isProductInCart(product: product)
                  ? 'Product In cart'
                  : 'Add To Cart',
              ontap: () {
                context.read<AddCartsCubit>().addCart(product: product);
              },
            ),
          ),
        );
      },
    );
  }
}
