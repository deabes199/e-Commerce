import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/features/login/logic/cubit/login_cubit.dart';

class ForgotBlocListener extends StatelessWidget {
  const ForgotBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(listener: (context, state) {
      if (state is ForgotPasswordLoading) {
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        );
      }else if(state is ForgotPasswordFailure){
           ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));

      }else{
         ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Check your email to reset password')));
        Navigator.of(context).pushReplacementNamed(Routes.loginScreen);

      }
    },
    child: const SizedBox.shrink(),);
  }
}
