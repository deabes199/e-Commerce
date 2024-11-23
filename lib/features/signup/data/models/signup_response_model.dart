import 'package:json_annotation/json_annotation.dart';
part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  final String name, email, token,image,phone;

  SignupResponseModel( 
      {required this.phone ,required this.image, required this.name, required this.email, required this.token});
  factory SignupResponseModel.fromJson(Map<String, dynamic> data) =>
      _$SignupResponseModelFromJson(data);
  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}
