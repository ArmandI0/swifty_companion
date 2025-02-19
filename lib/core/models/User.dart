import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String? email;
  final String? login;
  final String? first_name;
  final String? last_name;
  final String? usual_full_name;
  final String? usual_first_name;
  final String? url;
  final String? phone;
  final String? displayname;
  final String? kind;
  final UserImage? image;
  @JsonKey(name: 'staff?')
  final bool? staff;
  final int? correction_point;
  final String? pool_month;
  final String? pool_year; // Changé de int? à String?
  final String? location;
  final int? wallet; // Changé de int? à String?
  final String? anonymize_date; // Changé de DateTime? à String?
  final String? data_erasure_date; // Changé de DateTime? à String?
  final String? created_at; // Changé de DateTime? à String?
  final String? updated_at; // Changé de DateTime? à String?
  final String? alumnized_at; // Changé de DateTime? à String?
  @JsonKey(name: 'alumni?')
  final bool? alumni;
  @JsonKey(name: 'active?')
  final bool? active;

  User({
    required this.id,
    required this.email,
    required this.login,
    required this.first_name,
    required this.last_name,
    this.usual_full_name,
    this.usual_first_name,
    this.url,
    this.phone,
    this.displayname,
    this.kind,
    this.image,
    this.staff,
    this.correction_point,
    this.pool_month,
    this.pool_year,
    this.location,
    this.wallet,
    this.anonymize_date,
    this.data_erasure_date,
    this.created_at,
    this.updated_at,
    this.alumnized_at,
    this.alumni,
    this.active,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserImage {
  final String? link; // Rendu optionnel
  final ImageVersions? versions; // Rendu optionnel

  UserImage({this.link, this.versions}); // Suppression des required

  factory UserImage.fromJson(Map<String, dynamic> json) =>
      _$UserImageFromJson(json);
  Map<String, dynamic> toJson() => _$UserImageToJson(this);
}

@JsonSerializable()
class ImageVersions {
  final String? large; // Rendu optionnel
  final String? medium; // Rendu optionnel
  final String? small; // Rendu optionnel
  final String? micro; // Rendu optionnel

  ImageVersions({
    this.large,
    this.medium,
    this.small,
    this.micro,
  }); // Suppression des required

  factory ImageVersions.fromJson(Map<String, dynamic> json) =>
      _$ImageVersionsFromJson(json);
  Map<String, dynamic> toJson() => _$ImageVersionsToJson(this);
}
