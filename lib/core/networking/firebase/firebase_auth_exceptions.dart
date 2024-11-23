import 'package:firebase_auth/firebase_auth.dart';
import 'package:hero_store_app/core/networking/error_model.dart';

class FirebaseAuthFaliure extends ErrorModel {
  FirebaseAuthFaliure(super.message);
  factory FirebaseAuthFaliure.fromFirebaseAuthException(
      FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return FirebaseAuthFaliure('Invalid email address');
      case 'user-not-found':
        return FirebaseAuthFaliure('User not found');
      case 'wrong-password':
        return FirebaseAuthFaliure('Wrong password');
      case 'user-disabled':
        return FirebaseAuthFaliure('User account is disabled');
      case 'email-already-in-use':
        return FirebaseAuthFaliure('Email is already in use');
      case 'operation-not-allowed':
        return FirebaseAuthFaliure('Operation not allowed');
      case 'too-many-requests':
        return FirebaseAuthFaliure(
            'Too many login attempts. Please try again later.');
            
      default:
        return FirebaseAuthFaliure('An error occurred, please try again.');
    }
  }
}
