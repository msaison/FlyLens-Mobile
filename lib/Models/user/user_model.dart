import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
  @Default(null) String? id,
  @Default(null) String? email,
  @Default(null) String? accountType,
  @Default(null) String? profileType,
  @Default(null) String? socialMedia,
  @Default(null) String? publicPersonality,
  @Default(null) String? shopName,
  @Default(null) String? website,
  @Default(null) String? address,
  @Default(null) String? country,
  @Default(null) String? city,
  @Default(null) String? street,
  @Default(null) String? siret,
  @Default(null) String? lastName,
  @Default(null) String? firstName,
  @Default(null) String? userName,
  @Default([]) List<String> likedId,
  @Default(0) int postsNumber,
  @Default(0) int projectsNumber,
  @Default(0) int productsNumber,
  @Default(0) int eventsNumber,
  @Default(0) int followersNumber,
  @Default([]) List<String> followingsId,
  @Default([]) List<String> participatesId,
  @Default([]) List<String> keywords,
  @Default(null) String? image,
  @Default(null) String? description,
  @Default(false) bool registrationDone,
  @Default(false) bool socialRegister,
  @Default(true) bool notifAllowed,
  @Default(null) String? token,
  @Default({}) Map usersBlocked,
  @Default({}) Map blockedBy,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
