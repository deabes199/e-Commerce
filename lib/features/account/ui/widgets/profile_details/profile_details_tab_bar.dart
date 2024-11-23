import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

class ProfileDetailsTabBar extends StatelessWidget {
  const ProfileDetailsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pushNamed(Routes.wishlistScreen);
          },
          icon: Icon(Icons.favorite),
        ),
        Text('Profile', style: TextStyles.font20BlackBold),
        IconButton(
            onPressed: () {
              context.pushNamed(Routes.editProfileScreen);
            },
            icon: Icon(Icons.edit))
      ],
    );
  }
}
