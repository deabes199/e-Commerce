import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/signup/data/models/signup_request_model.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:hero_store_app/features/signup/data/repo/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(SignupInitial());
  final SignupRepo signupRepo;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confermPassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> signupKey = GlobalKey();

  signUp() async {
    emit(SignupLoading());
    SignupRequestModel newUser = SignupRequestModel(
      phone: phone.text,
      name: name.text,
      email: email.text,
      password: password.text,
      confermPassword: confermPassword.text,
    );
    final response = await signupRepo.signUp(newUser);
    response.fold((error) {
      emit(SignupFailure(message: error.message));
    }, (newUser) async {
      emit(SignupSuccess(newUser: newUser));
     
    });
  }

 
}
