import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:hero_store_app/features/home/ui/widgets/banners/tab_bar_bloc_builder.dart';
import 'package:hero_store_app/features/home/ui/widgets/some_product/product_text.dart';
import 'package:hero_store_app/features/home/ui/widgets/some_product/all_product_bloc_builder.dart';
import 'package:hero_store_app/features/home/ui/widgets/banners/home_banners.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getPaginationProducts();
      }
    });
  }

  final ScrollController scrollController = ScrollController();

  getPaginationProducts() async {
    if (context.read<HomeCubit>().isFirstLoading) {
      return;
    } else {
      context.read<HomeCubit>().getAllProduct(
          limit: 10, skip: context.read<HomeCubit>().productList.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DisplayNameAndPhotoHomeBlocBuilder(),
                const HomeBanners(),
                vertcalSpace(14),
                const ProductWidgetText(),
                vertcalSpace(10),
                const AllProductBlocBuilder()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
