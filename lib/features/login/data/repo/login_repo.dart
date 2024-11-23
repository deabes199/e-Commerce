import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hero_store_app/core/networking/firebase/firebase_auth_exceptions.dart';
import 'package:hero_store_app/core/networking/error_model.dart';
import 'package:hero_store_app/features/login/data/models/login_request_model.dart';
import 'package:hero_store_app/features/login/data/models/login_response_model.dart';

class LoginRepo {
  Future<Either<ErrorModel, LoginResponseModel>> login(
      LoginRequestModel loginRequest) async {
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginRequest.email, password: loginRequest.password);
      LoginResponseModel newUser = LoginResponseModel(token: response.user!.uid);
      return right(newUser);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return left(FirebaseAuthFaliure.fromFirebaseAuthException(error));
      } else {
      return left(ErrorModel(error.toString()));
      }
    }
  }
}
