import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/widgets/app_custom_button.dart';
import 'package:hero_store_app/core/widgets/app_text_form_field.dart';
import 'package:hero_store_app/features/account/logic/cubits/cubit/image_cubit.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';

import 'name_and_phone_update_method.dart';

class EditNameAndPhoneNumber extends StatefulWidget {
  const EditNameAndPhoneNumber({super.key});

  @override
  State<EditNameAndPhoneNumber> createState() => _EditNameAndPhoneNumberState();
}

class _EditNameAndPhoneNumberState extends State<EditNameAndPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    var profileCubit = context.read<ProfileInfoCubit>();
     var imageCubit = context.read<ImageCubit>();

    return Form(
        key: profileCubit.updateKey,
        child: Column(
          children: [
            AppTextFormField(
                hintText: 'New name', controller: profileCubit.newName),
            vertcalSpace(25),
            AppTextFormField(
                hintText: 'New phone', controller: profileCubit.newPhone),
            vertcalSpace(30),
            AppCustomButton(
              color: AppColors.primaryColor,
              label: 'Save edit',
              ontap: () async {
                await updateNameAndPhoneMethod(profileCubit,imageCubit);
              },
            )
          ],
        ));
  }
}
