import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';
import 'package:hero_store_app/features/account/ui/widgets/edit_profile/edit_text_fields.dart';

class UpdatedProfileBlocListener extends StatelessWidget {
  const UpdatedProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileInfoCubit, ProfileInfoState>(
      listener: (context, state) {
        if (state is UpdatetNameSuccessfully && state is UpdatetPhoneSuccessfully) {
           EditNameAndPhoneNumber();
        } else {
          const CircularProgressIndicator();
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
