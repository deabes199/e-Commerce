import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'Already have an account? ',
            style: TextStyles.font16GrayNormal),
        TextSpan(
            text: 'Login',
            style: TextStyles.font18primaryBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pushNamed(Routes.loginScreen);
              }),
      ])),
    );
  }
}
