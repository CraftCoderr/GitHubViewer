import 'package:flutter/foundation.dart';
import 'package:github_viewer/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable()
class RepoModel {
  final int id;
  final String name;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String description;
  final UserModel owner;
  final int stars;

  RepoModel(this.id, this.name, this.fullName, this.description, this.owner, this.stars);
}