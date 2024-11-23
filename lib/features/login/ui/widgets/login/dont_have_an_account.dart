import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'Dont have an account ? ',
            style: TextStyles.font16GrayNormal),
        TextSpan(
            text: ' Register Now',
            style: TextStyles.font18primaryBold.copyWith(fontSize: 16),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pushNamed(Routes.signupScreen);
              }),
      ])),
    );
  }
}
