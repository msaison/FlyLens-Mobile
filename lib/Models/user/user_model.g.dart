// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String? ?? null,
      email: json['email'] as String? ?? null,
      prenom: json['prenom'] as String? ?? null,
      naissance:
          const TimestampConverter().fromJson(json['naissance'] as Timestamp),
      profilePicture: json['profilePicture'] as String? ?? null,
      sexe: json['sexe'] as String? ?? null,
      registrationDone: json['registrationDone'] as bool? ?? false,
      socialRegister: json['socialRegister'] as bool? ?? false,
      company: json['company'] as String? ?? null,
      joinEnterprise: (json['joinEnterprise'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          null,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'prenom': instance.prenom,
      'naissance': const TimestampConverter().toJson(instance.naissance),
      'profilePicture': instance.profilePicture,
      'sexe': instance.sexe,
      'registrationDone': instance.registrationDone,
      'socialRegister': instance.socialRegister,
      'company': instance.company,
      'joinEnterprise': instance.joinEnterprise,
    };
