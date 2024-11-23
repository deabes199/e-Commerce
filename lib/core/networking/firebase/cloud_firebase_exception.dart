

import 'package:firebase_core/firebase_core.dart';
import 'package:hero_store_app/core/networking/error_model.dart';

class CloudFirestoreFailure extends ErrorModel{
  CloudFirestoreFailure(super.message);

  factory CloudFirestoreFailure.fromFirebaseCoreException(FirebaseException firebaseException) {
    switch (firebaseException.code) {
      case 'Disconnected':
        return CloudFirestoreFailure('The operation had to be aborted due to a network disconnect.');
      case 'ExpiredToken':
        return CloudFirestoreFailure('The supplied auth token has expired.');
      case 'InvalidToken':
        return CloudFirestoreFailure('The specified authentication token is invalid.');
      case 'NetworkError':
        return CloudFirestoreFailure('The operation could not be performed due to a network error.');
      case 'OperationFailed':
        return CloudFirestoreFailure('The server indicated that this operation failed.');
      case 'PermissionDenied':
        return CloudFirestoreFailure('This client does not have permission to perform this operation.');
      case 'Unavailable':
        return CloudFirestoreFailure('The service is unavailable.');
      case 'UserCodeException':
        return CloudFirestoreFailure('An exception occurred in user code.');
      case 'UnknownError':
        return CloudFirestoreFailure('An unknown error occurred.');
      default:
        return CloudFirestoreFailure('An unknown error occurred.');
    }
  }
}