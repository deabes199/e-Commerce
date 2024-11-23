import 'package:hero_store_app/features/account/logic/cubits/cubit/image_cubit.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';
import 'package:toast/toast.dart';

Future<void> updateNameAndPhoneMethod(
    ProfileInfoCubit profileCubit, ImageCubit imageCubit) async {
  var phone = profileCubit.newPhone.text;
  var name = profileCubit.newName.text;
  var image = await imageCubit.image;
  if (name.isNotEmpty && phone.isNotEmpty && image != null) {
    await profileCubit.updateName();
    await profileCubit.updatePhone();
    await imageCubit.updateUserImage();
    Toast.show(
      'Update name and phone and image successfully ✅',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  } else if (name.isNotEmpty && phone.isEmpty&& image == null) {
    await profileCubit.updateName();
    Toast.show(
      'Update name successfully ✅',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  } else if (name.isEmpty && phone.isNotEmpty&& image == null) {
    await profileCubit.updatePhone();
    Toast.show(
      'Update phone successfully ✅',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  }
  else if (name.isEmpty && phone.isEmpty&& image != null) {
    await imageCubit.updateUserImage();
    Toast.show(
      'Update image successfully ✅',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  } 
  else if (name.isNotEmpty && phone.isNotEmpty&& image == null) {
    await profileCubit.updateName();
      await profileCubit.updatePhone();
    Toast.show(
      'Update name and phone successfully ✅',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  } else {
    Toast.show(
      'Please fill in the required fields ❌  ',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  }
}
