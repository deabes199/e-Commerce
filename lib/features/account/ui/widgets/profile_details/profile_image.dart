import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/account/logic/cubits/cubit/image_cubit.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is UploadProfileImageSuccessfully) {
          return CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(state.imageUrl),
          );
        } else if (state is UploadProfileImageFaliure) {
          return Container();
        } else {
          return CircleAvatar(
            radius: 80,
            backgroundColor: Colors.black,
          );
        }
      },
    );
  }
}
