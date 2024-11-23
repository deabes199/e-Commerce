// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestModel _$SignupRequestModelFromJson(Map<String, dynamic> json) =>
    SignupRequestModel(
      phone: json['phone'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confermPassword: json['confermPassword'] as String,
    );

Map<String, dynamic> _$SignupRequestModelToJson(SignupRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'confermPassword': instance.confermPassword,
      'phone': instance.phone,
    };
