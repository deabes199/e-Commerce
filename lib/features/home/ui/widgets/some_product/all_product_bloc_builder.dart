import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/home/ui/widgets/some_product/all_product_grid_view.dart';
import 'package:hero_store_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:hero_store_app/features/products/ui/widgets/product/product_shimmer_loading.dart';

class AllProductBlocBuilder extends StatefulWidget {
  const AllProductBlocBuilder({super.key});

  @override
  State<AllProductBlocBuilder> createState() => _AllProductBlocBuilderState();
}

class _AllProductBlocBuilderState extends State<AllProductBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllProduct(limit: 10, skip: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is GetProductLoading) {
        return const ProductGridViewShimmerLoading();
      } else if (state is GetProductSuccess) {
        return AllProductGridView(
            productList: context.read<HomeCubit>().productList);
      } else if (state is GetProductPaginationLoading) {
        return Column(
          children: [
            AllProductGridView(
                productList: context.read<HomeCubit>().productList),
            ProductGridViewShimmerLoading(),
          ],
        );
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    });
  }
}
