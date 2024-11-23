import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';

class TextStyles {
  static TextStyle font20WhiteNormal = TextStyle(
    fontSize: 20.sp,
  );
  static TextStyle font14LightGray500W = TextStyle(
    fontSize: 14.sp,
    color: AppColors.lightGray,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font16GrayNormal = TextStyle(

    fontSize: 16.sp,
    color: AppColors.grayColor,
    fontWeight: FontWeight.normal,
    
  );
  static TextStyle font14BlackNormal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle font22BlackBold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font18BlackBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font35primaryBold = TextStyle(
    fontSize: 35.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font18primaryBold = TextStyle(
    fontSize: 18.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font22primaryNormal = TextStyle(
    fontSize: 22.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.normal,
  );
  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
}
