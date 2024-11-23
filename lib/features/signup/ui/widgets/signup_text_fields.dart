import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/widgets/app_custom_button.dart';
import 'package:hero_store_app/core/widgets/app_text_form_field.dart';
import 'package:hero_store_app/features/signup/logic/cubit/signup_cubit.dart';

class SignupTextFieldAndButton extends StatefulWidget {
  const SignupTextFieldAndButton({super.key});

  @override
  State<SignupTextFieldAndButton> createState() =>
      _SignupTextFieldAndButtonState();
}

class _SignupTextFieldAndButtonState extends State<SignupTextFieldAndButton> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    var signUpCubit = context.read<SignupCubit>();
    return Form(
      key: signUpCubit.signupKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            controller: signUpCubit.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
            },
          ),
          vertcalSpace(10),
          AppTextFormField(
            hintText: 'email',
            controller: signUpCubit.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'email is required';
              }
            },
          ),
          vertcalSpace(10),
          AppTextFormField(
            // keyboardType: TextInputType.phone,
            hintText: 'Phone',
            controller: signUpCubit.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'phone is required';
              }
            },
          ),
          vertcalSpace(10),
          AppTextFormField(
            hintText: 'password',
            controller: signUpCubit.password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'password is required';
              }
            },
            isobscureText: isObscure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          vertcalSpace(10),
          AppTextFormField(
            hintText: 'Conferm password',
            controller: signUpCubit.confermPassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'password is required';
              }
            },
            isobscureText: isObscure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          vertcalSpace(40),
          AppCustomButton(
            label: 'Create Account',
            color: AppColors.primaryColor,
            ontap: () async {
              if (signUpCubit.signupKey.currentState!.validate()) {
                await signUpCubit.signUp();
              }
            },
          )
        ],
      ),
    );
  }
}
