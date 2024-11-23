import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hero_store_app/core/helpers/app_constant.dart';
import 'package:hero_store_app/core/helpers/flutter_secure_stoarge.dart';
import 'package:hero_store_app/core/networking/error_model.dart';
import 'package:hero_store_app/core/networking/firebase/cloud_firebase_exception.dart';
import 'package:hero_store_app/core/networking/firebase/firebase_storage_exception.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepo {
  final firestore = FirebaseFirestore.instance;

  Future<Either<ErrorModel, SignupResponseModel>> displayProfileInfo() async {
    try {
      final ref = firestore.collection('users').doc(
          await SecureStorageHelper.getSecuredString(AppConstant.userToken));
      final snapshot = await ref.get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        SignupResponseModel newUser = SignupResponseModel(
            phone: data['phone'],
            image: data['image'],
            name: data['name'],
            email: data['email'],
            token: data['token']);
        return right(newUser);
      } else {
        throw ErrorModel('User not found');
      }
    } catch (error) {
      if (error is FirebaseException) {
        return left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return left(ErrorModel(error.toString()));
      }
    }
  }

  Future<Either<ErrorModel, String>> updateName(String newName) async {
    try {
      final ref = firestore.collection('users').doc(
          await SecureStorageHelper.getSecuredString(AppConstant.userToken));
      await ref.update({
        'name': newName,
      });
      return right('Uodated success');
    } catch (e) {
      return left(ErrorModel(e.toString()));
    }
  }

  Future<Either<ErrorModel, String>> updatePhoneNumber(String phone) async {
    try {
      final ref = firestore.collection('users').doc(
          await SecureStorageHelper.getSecuredString(AppConstant.userToken));
      await ref.update({'phone': phone});
      return right('Updated success');
    } catch (e) {
      return left(ErrorModel(e.toString()));
    }
  }

  Future<Either<ErrorModel, File?>> pickImage() async {
    File? image;
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        return right(image);
      }
      return left(ErrorModel('image not picked'));
    } catch (error) {
      return left(ErrorModel(error.toString()));
    }
  }
  Future<Either<ErrorModel,String>> updateImage(File imageFile)async{
    try {
      String fileName=DateTime.now().millisecondsSinceEpoch.toString();
      final refStoarge= FirebaseStorage.instance.ref().child('users/$fileName');
      UploadTask uploadTask=refStoarge.putFile(imageFile);
      TaskSnapshot taskSnapshot= await uploadTask.whenComplete(()=>null);
      String downloadUrl=await taskSnapshot.ref.getDownloadURL();
      final userRef=firestore.collection('users').doc(await SecureStorageHelper.getSecuredString(AppConstant.userToken));
      await userRef.update({'image':downloadUrl});
      return right(downloadUrl);
    } catch (error) {
      if(error is FirebaseException){
        return left(FirebaseStorageFailure.fromFirebaseCoreException(error));
      }else{
        return left(FirebaseStorageFailure(error.toString()));
      }
      
    }
    
  }

  
}
