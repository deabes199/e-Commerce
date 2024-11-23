import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/home/ui/widgets/banners/home_tab_bar.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';

class DisplayNameAndPhotoHomeBlocBuilder extends StatelessWidget {
  const DisplayNameAndPhotoHomeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
        builder: (context, state) {
      if (state is ProfileInfoLoading) {
        return const CircularProgressIndicator();
      } else if (state is ProfileInfoSuccess) {
        return HomeTabBar(user: state.newUser);
      } else {
        return SizedBox.shrink();
      }
    });
  }
}
