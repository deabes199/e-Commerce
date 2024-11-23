import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/features/products/data/models/category_model.dart';

class CategoiesItems extends StatelessWidget {
  const CategoiesItems(
      {super.key,
      required this.itemIndex,
      required this.selectedIndex,
      required this.category});
  final int itemIndex;
  final int selectedIndex;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 16.w),
      child: Column(
        children: [
          Container(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              category.name,
              style: TextStyle(
                  color: itemIndex == selectedIndex
                      ? Colors.white
                      : AppColors.primaryColor),
            ),
            decoration: BoxDecoration(
              color: itemIndex == selectedIndex
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}

