import 'package:json_annotation/json_annotation.dart';
part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String name, email, password, confermPassword, phone;

  SignupRequestModel(
      {required this.phone,
      required this.name,
      required this.email,
      required this.password,
      required this.confermPassword});
  factory SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);
}
