import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/features/account/data/profile_repo.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:meta/meta.dart';

part 'profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit(this.profileRepo) : super(ProfileInfoInitial());
  final ProfileRepo profileRepo;
  TextEditingController newName = TextEditingController();
  TextEditingController newPhone = TextEditingController();
  GlobalKey<FormState> updateKey = GlobalKey();
  String imageUrll = '';
  File? image;

  displayProfileInfo() async {
    emit(ProfileInfoLoading());
    final response = await profileRepo.displayProfileInfo();
    response.fold((error) {
      emit(ProfileInfoFaliure(message: error.message));
    }, (newUser) {
      emit(ProfileInfoSuccess(newUser: newUser));
    });
  }

  updateName() async {
    await profileRepo.updateName(
      newName.text,
    );
    emit(UpdatetNameSuccessfully());
    final response = await profileRepo.displayProfileInfo();
    response.fold((error) {
      emit(UpdatetFaliure(message: error.message));
    }, (user) {
      emit(ProfileInfoSuccess(newUser: user));
    });
  }

  updatePhone() async {
    await profileRepo.updatePhoneNumber(newPhone.text);
    emit(UpdatetPhoneSuccessfully());
    final response = await profileRepo.displayProfileInfo();
    response.fold((error) {
      emit(ProfileInfoFaliure(message: error.message));
    }, (user) {
      emit(ProfileInfoSuccess(newUser: user));
    });
  }
  ////// image////////////

 
}
