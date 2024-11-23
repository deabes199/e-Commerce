import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/signup/logic/cubit/signup_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          );
        } else if (state is SignupFailure) {
          showErrorDialog(context, state);
        } else {
        
              Navigator.of(context).pushNamed(Routes.loginScreen);
      
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void showErrorDialog(BuildContext context, SignupFailure state) {
        showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon:const Icon(
                Icons.error,
                color: Colors.red,
                size: 30,
              ),
              content: Text(
                state.message,
                style: TextStyles.font14BlackNormal,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Got It',
                      style: TextStyles.font14BlackNormal
                          .copyWith(color: AppColors.primaryColor),
                    ))
              ],
            ));
  }
}
