import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/account/ui/widgets/profile_details/custom_profile_details_widget.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';

class UserNameAndEmail extends StatelessWidget {
  const UserNameAndEmail({super.key, required this.user});
  final SignupResponseModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            CustomProfileDetailsWidget(
              title: 'Name',
              subtitle: user.name,
            ),
            vertcalSpace(10),
            CustomProfileDetailsWidget(
              title: 'Email',
              subtitle: user.email,
            ),
            vertcalSpace(10),
            CustomProfileDetailsWidget(
              title: 'Phone Number',
              subtitle: user.phone,
            ),
          ],
        ),
      ],
    );
  }
}

