import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/cubit/theme_cubit.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/core/theming/theme_style.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:shimmer/shimmer.dart';

class HomeTabBar extends StatelessWidget {
  final SignupResponseModel user;
  const HomeTabBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(user.image),
        ),
        horzintalSpace(6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello!',
              style: TextStyles.font18primaryBold,
            ),
            Text(
              user.name,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: Icon(
              context.watch<ThemeCubit>().state == AppThemes.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ))
      ],
    );
  }
}
