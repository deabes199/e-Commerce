import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/wishList/ui/widgets/wishlist_list_view.dart';
import 'package:hero_store_app/features/wishList/ui/widgets/wishlist_tab_bar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              const WishlistTabBar(),
              vertcalSpace(20),
              const WishlistListView()
            ],
          ),
        ),
      ),
    );
  }
}
