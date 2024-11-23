import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/widgets/screen_message.dart';
import 'package:hero_store_app/features/login/ui/widgets/login/dont_have_an_account.dart';
import 'package:hero_store_app/features/login/ui/widgets/login/email_and_password_login.dart';
import 'package:hero_store_app/features/login/ui/widgets/login/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                vertcalSpace(40),
                const ScreenMessage(text: 'Welcome\nBack!'),
                vertcalSpace(30),
                const EmailAndPassword(),
                vertcalSpace(20),
                const DontHaveAnAccountText(),
                const LoginBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
