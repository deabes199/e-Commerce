import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/app_constant.dart';
import 'package:hero_store_app/core/helpers/flutter_secure_stoarge.dart';
import 'package:hero_store_app/core/networking/api/dio_factory.dart';
import 'package:hero_store_app/features/login/data/models/login_request_model.dart';
import 'package:hero_store_app/features/login/data/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> forgotKey = GlobalKey();
  login() async {
    emit(LoginLoading());
    LoginRequestModel newUser =
        LoginRequestModel(email: email.text, password: password.text);
    final response = await loginRepo.login(newUser);

    response.fold((error) {
      emit(LoginFailure(errorMessage: error.message));
    }, (newUser) async {
      await saveUserToken(newUser.token);
      emit(LoginSuccess(token: newUser.token));
    });
  }

  Future<void> resetPasswordWithEmail() async {
    emit(ForgotPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      emit(ForgotPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ForgotPasswordFailure(errorMessage: e.message.toString()));
    }
  }

  Future<void> saveUserToken(String token) async {
    SecureStorageHelper.setSecuredString(AppConstant.userToken, token);
    DioFactory.setTokenAfterLogin(token);
  }
}
