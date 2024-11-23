import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';
import 'package:hero_store_app/features/account/ui/widgets/profile_details/username_and_email.dart';

class UsernameAndEmailBlocBuilder extends StatelessWidget {
  const UsernameAndEmailBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
        builder: (context, state) {
      if (state is ProfileInfoLoading) {
        return CircularProgressIndicator();
      } else if (state is ProfileInfoSuccess) {
        return UserNameAndEmail(user: state.newUser);
      } else {
        return SizedBox.shrink();
      }
    });
  }
}


