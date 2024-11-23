import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:hero_store_app/features/account/data/profile_repo.dart';
import 'package:meta/meta.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit(this.profileRepo) : super(ImageInitial());
  final ProfileRepo profileRepo;
  File? image;
  String imageUrll = '';

  pickImage() async {
    final response = await profileRepo.pickImage();
    response.fold((error) {
      emit(UploadProfileImageFaliure(message: error.message));
    }, (imageFile) {
      image = imageFile;
      emit(PickImageSuccess(image: image));
    });
  }

  uploadProfileImage() async {
    final response = await profileRepo.displayProfileInfo();
    response.fold((error) {
      emit(UploadProfileImageFaliure(message: error.message));
    }, (user) {
      emit(UploadProfileImageSuccessfully(imageUrl: user.image));
      imageUrll = user.image;
    });
  }

  updateUserImage() async {
    emit(UploadProfileImageLoading());
    final response = await profileRepo.updateImage(image!);
    response.fold((error) {
      emit(UploadProfileImageFaliure(message: error.message));
    }, (imageUrl) {
      imageUrll = imageUrl;
      emit(UploadProfileImageSuccessfully(imageUrl: imageUrl));
    });
  }
}
