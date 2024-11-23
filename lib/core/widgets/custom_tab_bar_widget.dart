import 'package:flutter/material.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/core/widgets/custom_circle_container.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget(
      {super.key, required this.title, required this.widget, this.onPressed});
  final String title;
  final Widget widget;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        Text(title, style: TextStyles.font22BlackBold),
        widget,
      ],
    );
  }
}
