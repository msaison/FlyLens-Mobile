// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String? ?? null,
      email: json['email'] as String? ?? null,
      accountType: json['accountType'] as String? ?? null,
      profileType: json['profileType'] as String? ?? null,
      socialMedia: json['socialMedia'] as String? ?? null,
      publicPersonality: json['publicPersonality'] as String? ?? null,
      shopName: json['shopName'] as String? ?? null,
      website: json['website'] as String? ?? null,
      address: json['address'] as String? ?? null,
      country: json['country'] as String? ?? null,
      city: json['city'] as String? ?? null,
      street: json['street'] as String? ?? null,
      siret: json['siret'] as String? ?? null,
      lastName: json['lastName'] as String? ?? null,
      firstName: json['firstName'] as String? ?? null,
      userName: json['userName'] as String? ?? null,
      likedId: (json['likedId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      postsNumber: json['postsNumber'] as int? ?? 0,
      projectsNumber: json['projectsNumber'] as int? ?? 0,
      productsNumber: json['productsNumber'] as int? ?? 0,
      eventsNumber: json['eventsNumber'] as int? ?? 0,
      followersNumber: json['followersNumber'] as int? ?? 0,
      followingsId: (json['followingsId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      participatesId: (json['participatesId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      keywords: (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      image: json['image'] as String? ?? null,
      description: json['description'] as String? ?? null,
      registrationDone: json['registrationDone'] as bool? ?? false,
      socialRegister: json['socialRegister'] as bool? ?? false,
      notifAllowed: json['notifAllowed'] as bool? ?? true,
      token: json['token'] as String? ?? null,
      usersBlocked: json['usersBlocked'] as Map<String, dynamic>? ?? const {},
      blockedBy: json['blockedBy'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'accountType': instance.accountType,
      'profileType': instance.profileType,
      'socialMedia': instance.socialMedia,
      'publicPersonality': instance.publicPersonality,
      'shopName': instance.shopName,
      'website': instance.website,
      'address': instance.address,
      'country': instance.country,
      'city': instance.city,
      'street': instance.street,
      'siret': instance.siret,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'userName': instance.userName,
      'likedId': instance.likedId,
      'postsNumber': instance.postsNumber,
      'projectsNumber': instance.projectsNumber,
      'productsNumber': instance.productsNumber,
      'eventsNumber': instance.eventsNumber,
      'followersNumber': instance.followersNumber,
      'followingsId': instance.followingsId,
      'participatesId': instance.participatesId,
      'keywords': instance.keywords,
      'image': instance.image,
      'description': instance.description,
      'registrationDone': instance.registrationDone,
      'socialRegister': instance.socialRegister,
      'notifAllowed': instance.notifAllowed,
      'token': instance.token,
      'usersBlocked': instance.usersBlocked,
      'blockedBy': instance.blockedBy,
    };
