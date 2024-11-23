import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/core/widgets/app_custom_button.dart';
import 'package:hero_store_app/core/widgets/app_text_form_field.dart';
import 'package:hero_store_app/features/login/logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscure = true;
  @override
  
  Widget build(BuildContext context) {
    var loginCubit = context.read<LoginCubit>();
    return Form(
        key: loginCubit.loginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyles.font20WhiteNormal
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            vertcalSpace(20),
            AppTextFormField(
              hintText: 'email',
              controller: loginCubit.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'email is required';
                }
              },
            ),
            vertcalSpace(20),
            AppTextFormField(
              isobscureText: isObscure,
              hintText: 'password',
              controller: loginCubit.password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child:
                    Icon(isObscure ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            vertcalSpace(10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.forgotPasswordScreen);
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyles.font18primaryBold.copyWith(fontSize: 16),
                ),
              ),
            ),
            vertcalSpace(40),
            AppCustomButton(
              label: 'Login',
              color: AppColors.primaryColor,
              ontap: () async {
                if (loginCubit.loginKey.currentState!.validate()) {
                  await loginCubit.login();
                }
              },
            )
          ],
        ));
  }
}
