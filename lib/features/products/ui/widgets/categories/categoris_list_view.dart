import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/products/data/models/category_model.dart';
import 'package:hero_store_app/features/products/logic/cubit/category_cubit.dart';
import 'package:hero_store_app/features/products/ui/widgets/categories/category_item.dart';

class CategorisListView extends StatefulWidget {
  const CategorisListView({super.key, required this.categoryList});
  final List<CategoryModel> categoryList;

  @override
  State<CategorisListView> createState() => _CategorisListViewState();
}

class _CategorisListViewState extends State<CategorisListView> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: widget.categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context
                    .read<CategoryCubit>()
                    .getProductById(widget.categoryList[index].name);

                setState(() {
                  selectedIndex = index;
                });
              },
              child: CategoiesItems(
                category: widget.categoryList[index],
                itemIndex: index,
                selectedIndex: selectedIndex,
              ),
            );
          }),
    );
  }
}
