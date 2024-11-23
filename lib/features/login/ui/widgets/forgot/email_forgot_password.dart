import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/widgets/app_custom_button.dart';
import 'package:hero_store_app/core/widgets/app_text_form_field.dart';
import 'package:hero_store_app/features/login/logic/cubit/login_cubit.dart';

class EnterEmailTextField extends StatelessWidget {
  const EnterEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit = context.read<LoginCubit>();

    return Form(
      key: loginCubit.forgotKey,
      child: Column(
        children: [
          AppTextFormField(
              hintText: 'Enter your email',
              controller: loginCubit.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'email is required';
                }
              }),
          vertcalSpace(30),
          AppCustomButton(
            label: 'Submit',
            color: AppColors.primaryColor,
            ontap: () async {
              if (loginCubit.forgotKey.currentState!.validate()) {
                await loginCubit.resetPasswordWithEmail();
              }
            },
          )
        ],
      ),
    );
  }
}
