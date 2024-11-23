import 'package:flutter/material.dart';

class ManTextFormField extends StatelessWidget {
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  final String? hintText;
  final bool? isObscure;

  final Widget? suffixIcon;
  const ManTextFormField(
      {super.key,
      required this.controller,
      this.hintText,
      this.isObscure,
  
      this.suffixIcon,
      this.onFieldSubmitted,
      this.focusNode,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: isObscure ?? false,
     
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
