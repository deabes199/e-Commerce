import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/assets_manager.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';

class HomeBanners extends StatelessWidget {
  const HomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Swiper(
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: Colors.grey,
            activeColor: AppColors.primaryColor,
          ),
        ),
        autoplay: true,
        itemCount: AppLists.banners.length,
        itemBuilder: (context, index) {
          return Image.asset(AppLists.banners[index]);
        },
      ),
    );
  }
}
