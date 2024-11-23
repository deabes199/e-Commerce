import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/features/account/ui/widgets/profile_details/profile_details_tab_bar.dart';
import 'package:hero_store_app/features/account/ui/widgets/profile_details/profile_image.dart';
import 'package:hero_store_app/features/account/ui/widgets/profile_details/username_and_email_bloc_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProfileDetailsTabBar(),
                vertcalSpace(20),
                const ProfileImage(),
                vertcalSpace(40),
                const UsernameAndEmailBlocBuilder(),
                vertcalSpace(20),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    context.pushNamed(Routes.loginScreen);
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
