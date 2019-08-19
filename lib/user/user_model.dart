import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable()
class UserModel {
  final String login;
  final int id;
  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  UserModel(this.login, this.id, this.avatarUrl);
  
}