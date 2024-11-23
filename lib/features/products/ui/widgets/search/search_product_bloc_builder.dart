import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/products/logic/search_cubit/cubit/search_cubit.dart';
import 'package:hero_store_app/features/products/ui/widgets/search/search_product_grid_view.dart';

class SearchProductBlocBuilder extends StatelessWidget {
  const SearchProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchproductCubit, SearchProductState>(
        builder: (context, state) {
      if (state is SearchLoading) {
        return const CircularProgressIndicator();
      } else if (state is SearchSuccess) {
        List<Product> productList = state.productList;
        return productList.isEmpty
            ? Center(
                child: Image.asset('assets/images/no-product-found.png'),
              )
            : SearchProductsGridView(productList: productList);
      } else if (state is SearchInitial) {
        return Column(
          children: [
            vertcalSpace(200),
            Center(
              child: Image.asset(
                'assets/images/search-icon-png-7.jpg',
                height: 200,
                width: 200,
              ),
            ),
          ],
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
