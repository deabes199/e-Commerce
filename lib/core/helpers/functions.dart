import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hero_store_app/core/helpers/app_constant.dart';
import 'package:hero_store_app/core/helpers/flutter_secure_stoarge.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:hero_store_app/main.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';


class HelperFunctions {
  Future<void> addUserToFirestore(SignupResponseModel userModel) async {
    final firestore = FirebaseFirestore.instance;
    final user = firestore.collection('users').doc(userModel.token);
    await user.set({
      'name': userModel.name,
      'email': userModel.email,
      'image': userModel.image,
      'token': userModel.token,
      'phone':userModel.phone,
      
    });
  }

 static checkIfLoggedInUser() async {
  String? userToken =
      await SecureStorageHelper.getSecuredString(AppConstant.userToken);
  //userToken!= nuu&& userToken.isNotEmpty
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

}
