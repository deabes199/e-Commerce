// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      phone: json['phone'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$SignupResponseModelToJson(
        SignupResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
      'image': instance.image,
      'phone': instance.phone,
    };
