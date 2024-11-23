import 'package:flutter/material.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

class CartTotalRowWidget extends StatelessWidget {
  const CartTotalRowWidget(
      {super.key, required this.text, required this.number, this.fontWeight});
  final String text, number;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: fontWeight),
        ),
        Text(
          number,
          style: TextStyles.font22primaryNormal.copyWith(fontSize: 18),
        )
      ],
    );
  }
}
