import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hero_store_app/core/helpers/assets_manager.dart';
import 'package:hero_store_app/core/helpers/functions.dart';
import 'package:hero_store_app/core/networking/firebase/cloud_firebase_exception.dart';
import 'package:hero_store_app/core/networking/firebase/firebase_auth_exceptions.dart';
import 'package:hero_store_app/core/networking/error_model.dart';
import 'package:hero_store_app/features/signup/data/models/signup_request_model.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';

class SignupRepo {
  Future<Either<ErrorModel, SignupResponseModel>> signUp(
      SignupRequestModel signupRequest) async {
    try {
      final response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupRequest.email,
        password: signupRequest.password,
      );
      SignupResponseModel newUser = SignupResponseModel(
        phone: signupRequest.phone,
        image: AssetsManager.defaultprofileImage,
        name: signupRequest.name,
        email: signupRequest.email,
        token: response.user!.uid,
      );

      await HelperFunctions().addUserToFirestore(newUser);
      return right(newUser);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return left(FirebaseAuthFaliure.fromFirebaseAuthException(error));
      } else if (error is FirebaseException) {
        return left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return left(ErrorModel(error.toString()));
      }
    }
  }
}
