import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/core/widgets/custom_tab_bar_widget.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';

class WishlistTabBar extends StatelessWidget {
  const WishlistTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return CustomTabBarWidget(
          title: 'My favorite',
          widget: context.read<FavoritesCubit>().favorites.isEmpty
              ? Container()
              : TextButton(
                  onPressed: () {
                    context.read<FavoritesCubit>()..clearFavorites();
                  },
                  child: Text('Clear All',
                      style:
                          TextStyles.font18primaryBold.copyWith(fontSize: 15)),
                ),
        );
      },
    );
  }
}
