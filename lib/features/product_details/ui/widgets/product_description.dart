import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

class ProductDecription extends StatelessWidget {
  const ProductDecription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style:TextStyles.font22BlackBold,
          ),
          vertcalSpace(7),
          Text(
            description,
            style: TextStyles.font16GrayNormal,
          )
        ],
      ),
    );
  }
}
