import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
  @Default(null) String? id,
  @Default(null) String? email,
  @Default(null) String? prenom,
  @TimestampConverter() required DateTime naissance,
  @Default(null) String? profilePicture,
  @Default(null) String? sexe,
  @Default(false) bool registrationDone,
  @Default(false) bool socialRegister,
  @Default(null) List<String>? enterprise,
  @Default(null) List<String>? joinEnterprise,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
