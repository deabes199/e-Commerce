part of 'image_cubit.dart';

@immutable
sealed class ImageState {}

final class ImageInitial extends ImageState {}
final class UploadProfileImageSuccessfully extends ImageState {
  final String imageUrl;

  UploadProfileImageSuccessfully({required this.imageUrl});
}

class UploadProfileImageFaliure extends ImageState {
  final String message;

  UploadProfileImageFaliure({required this.message});
}
class UploadProfileImageLoading extends ImageState {}
class PickImageSuccess extends ImageState {
  final File? image;

  PickImageSuccess({required this.image});
  
}
