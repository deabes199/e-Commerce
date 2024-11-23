import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/widgets/screen_message.dart';
import 'package:hero_store_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:hero_store_app/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:hero_store_app/features/signup/ui/widgets/signup_text_fields.dart';

import '../widgets/already_have_an_account.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vertcalSpace(20),
              const ScreenMessage(text: 'Create\nan account'),
           
              vertcalSpace(20),
              const SignupTextFieldAndButton(),
              vertcalSpace(30),
              const AlreadyHaveAnAccountWidget(),
              const SignupBlocListener()
            ],
          ),
        ),
      )),
    );
  }
}

