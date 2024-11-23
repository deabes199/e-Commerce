import 'package:flutter/material.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

class ProductWidgetText extends StatelessWidget {
  const ProductWidgetText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor,
        ),
        child: Text(
          'All Products',
          style: TextStyles.font14LightGray500W.copyWith(color: Colors.white),
        ));
  }
}
