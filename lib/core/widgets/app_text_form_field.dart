import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.contantPadding,
      this.enabledBorder,
      this.focusedBorder,
      required this.hintText,
      this.isobscureText,
      this.backgroundColor,
      this.hintStyle,
      this.inPutTextStyle,
      this.suffixIcon,
      required this.controller,
      this.validator,
      this.prefixIcon,
      this.onChanged,
      this.keyboardType});
  final EdgeInsetsGeometry? contantPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String hintText;
  final bool? isobscureText;
  final Color? backgroundColor;
  final TextStyle? hintStyle;
  final TextStyle? inPutTextStyle;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final Function(String?)? validator;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: contantPadding ??
                EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.w),
            hintText: hintText,
            hintStyle: hintStyle ?? TextStyles.font14LightGray500W,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon),
        controller: controller,
        validator: (value) {
          return validator!(value);
        },
        obscureText: isobscureText ?? false,
        style: inPutTextStyle ?? TextStyles.font14BlackNormal);
  }
}
