import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/login/logic/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
              context: context,
              builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ));
        } else if (state is LoginFailure) {
          showErrorDialog(context, state);
        } else {
          Navigator.of(context).pushNamed(Routes.bottomNavBarScreen);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void showErrorDialog(BuildContext context, LoginFailure state) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
                size: 30,
              ),
              content: Text(
                state.errorMessage,
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
