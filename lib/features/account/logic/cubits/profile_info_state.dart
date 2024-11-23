part of 'profile_info_cubit.dart';

@immutable
sealed class ProfileInfoState {}

final class ProfileInfoInitial extends ProfileInfoState {}

final class ProfileInfoLoading extends ProfileInfoState {}

final class ProfileInfoSuccess extends ProfileInfoState {
  final SignupResponseModel newUser;

  ProfileInfoSuccess({required this.newUser});
}

final class ProfileInfoFaliure extends ProfileInfoState {
  final String message;

  ProfileInfoFaliure({required this.message});
}

final class UpdatetNameSuccessfully extends ProfileInfoState {}

final class UpdatetPhoneSuccessfully extends ProfileInfoState {}

final class UpdatetFaliure extends ProfileInfoState {
  final String message;

  UpdatetFaliure({required this.message});
}


//////// image upload/////////////////////



