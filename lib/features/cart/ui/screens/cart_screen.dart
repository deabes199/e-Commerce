import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/cart/ui/widgets/cart_list_view.dart';
import 'package:hero_store_app/features/cart/ui/widgets/cart_tab_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            const CartTabBar(),
            vertcalSpace(15),
            const CartListView(),
          
          ],
        ),
      ),
    ));
  }
}
