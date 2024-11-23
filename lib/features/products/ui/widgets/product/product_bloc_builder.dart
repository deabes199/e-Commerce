import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/products/logic/cubit/category_cubit.dart';
import 'package:hero_store_app/features/products/ui/widgets/product/product_grid_view.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            current is ProductLoading ||
            current is ProductSuccess ||
            current is ProductFaliure,
        builder: (context, state) {
          if (state is ProductSuccess) {
            return ProductsGridView(productList: state.productList);
          } else if (state is ProductFaliure) {
            return Container(
              child: Text(state.message),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
