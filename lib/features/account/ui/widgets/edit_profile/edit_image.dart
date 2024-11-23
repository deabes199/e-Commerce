import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/account/logic/cubits/cubit/image_cubit.dart';

class EditImageWidget extends StatelessWidget {
  const EditImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
      if (state is UploadProfileImageSuccessfully) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              child: CircleAvatar(
                radius: 80,
               backgroundImage: NetworkImage(state.imageUrl),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 5,
              child: GestureDetector(
                onTap: () async {
                  await context.read<ImageCubit>().pickImage();
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.edit),
                ),
              ),
            ),
          ],
        );
      } else if (state is PickImageSuccess) {
        return SizedBox(
          child: CircleAvatar(
            radius: 80,
            backgroundImage: FileImage(state.image!),
          ),
        );
      } else if (state is UploadProfileImageFaliure) {
        return SizedBox(
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Colors.black,
          ),
        );
      } else if (state is UploadProfileImageLoading) {
        return CircularProgressIndicator(
          color: Colors.red,
        );
      } else {
        return SizedBox();
      }
    });
  }
}