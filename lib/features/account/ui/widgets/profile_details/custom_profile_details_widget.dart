import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

class CustomProfileDetailsWidget extends StatelessWidget {
  const CustomProfileDetailsWidget(
      {super.key, required this.title, required this.subtitle});
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font18primaryBold.copyWith(fontSize: 16),
        ),
        vertcalSpace(10),
        Text(
          subtitle,
          style: TextStyles.font14BlackNormal,
        ),
        vertcalSpace(10),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
