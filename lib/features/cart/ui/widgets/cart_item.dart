import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCartsCubit, AddCartsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 130.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.mainImage.toString(),
                        fit: BoxFit.cover,
                        width: 150.w,
                        height: 115.h,
                      ),
                    ),
                    horzintalSpace(10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(product.title ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyles.font18BlackBold),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<AddCartsCubit>()
                                        .removeCart(product: product);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                          vertcalSpace(7),
                          Text(
                            product.category ?? '',
                            style: TextStyles.font16GrayNormal,
                          ),
                          vertcalSpace(7),
                          FittedBox(
                            child: Row(
                              children: [
                                Text('\$ ${product.price}',
                                    style: TextStyles.font18primaryBold),
                                horzintalSpace(25),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          context
                                              .read<AddCartsCubit>()
                                              .quantityMinus(product);
                                        },
                                        child: SvgPicture.asset(
                                            'assets/svg/dec.svg')),
                                    horzintalSpace(12),
                                    Text(
                                        context
                                            .read<AddCartsCubit>()
                                            .quantity
                                            .toString(),
                                        style: TextStyles.font18BlackBold),
                                    horzintalSpace(12),
                                    InkWell(
                                        onTap: () {
                                          context
                                              .read<AddCartsCubit>()
                                              .quantityPlus(product);
                                        },
                                        child: SvgPicture.asset(
                                            'assets/svg/inc.svg')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
