import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/products/logic/cubit/category_cubit.dart';
import 'package:hero_store_app/features/products/ui/widgets/categories/categoris_list_view.dart';
import 'package:hero_store_app/features/products/ui/widgets/categories/category_shimmer.dart';
import 'package:hero_store_app/features/products/ui/widgets/categories/expanded_product_shimmer_loading.dart';
import 'package:hero_store_app/features/products/ui/widgets/product/product_shimmer_loading.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListBlocBuilder extends StatelessWidget {
  const CategoryListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            current is CategoryLoading ||
            current is CategorySuccess ||
            current is CategoryFaliure,
        builder: (context, state) {
          if (state is CategoryLoading) {
            return setupLoading();
          } else if (state is CategorySuccess) {
            return CategorisListView(categoryList: state.categoryList);
          } else if (state is CategoryFaliure) {
            return CircularProgressIndicator();
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

Widget setupLoading() {
  return Expanded(
      child: Column(
    children: [
      const CategoryShimmerLoading(),
      vertcalSpace(10),
      const ExpandedProductGridViewShimmer()
    ],
  ));
}
