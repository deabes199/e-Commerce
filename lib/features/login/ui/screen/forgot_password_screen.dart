import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/widgets/screen_message.dart';
import 'package:hero_store_app/features/login/ui/widgets/forgot/email_forgot_password.dart';
import 'package:hero_store_app/features/login/ui/widgets/forgot/forgot_bloc_listener.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vertcalSpace(40),
              const ScreenMessage(text: 'Forgot\nPassword?'),
              vertcalSpace(20),
              const EnterEmailTextField(),
             const   ForgotBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}

