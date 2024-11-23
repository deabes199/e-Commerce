import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';
import 'package:hero_store_app/features/cart/ui/widgets/cart_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCartsCubit, AddCartsState>(
      builder: (context, state) {
        return context.read<AddCartsCubit>().cartList.isEmpty
            ? Column(
                children: [
                  vertcalSpace(100),
                  Image.asset('assets/images/aa.jpg')
                ],
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: context.read<AddCartsCubit>().cartList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CartItems(
                        product: context.read<AddCartsCubit>().cartList[index],
                      );
                    }));
      },
    );
  }
}
