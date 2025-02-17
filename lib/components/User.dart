import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String email;
  final String login;
  final String firstName;
  final String lastName;
  final String usualFullName;
  final String? usualFirstName;
  final String url;
  final String? phone;
  final String displayName;
  final String kind;
  final UserImage image;
  final bool staff;
  final int correctionPoint;
  final String poolMonth;
  final int poolYear;
  final String? location;
  final int wallet;
  final DateTime anonymizeDate;
  final DateTime dataErasureDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? alumnizedAt;
  final bool alumni;
  final bool active;

  User({
    required this.id,
    required this.email,
    required this.login,
    required this.firstName,
    required this.lastName,
    required this.usualFullName,
    this.usualFirstName,
    required this.url,
    this.phone,
    required this.displayName,
    required this.kind,
    required this.image,
    required this.staff,
    required this.correctionPoint,
    required this.poolMonth,
    required this.poolYear,
    this.location,
    required this.wallet,
    required this.anonymizeDate,
    required this.dataErasureDate,
    required this.createdAt,
    required this.updatedAt,
    this.alumnizedAt,
    required this.alumni,
    required this.active,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserImage {
  final String link;
  final ImageVersions versions;

  UserImage({
    required this.link,
    required this.versions,
  });

  factory UserImage.fromJson(Map<String, dynamic> json) => _$UserImageFromJson(json);
  Map<String, dynamic> toJson() => _$UserImageToJson(this);
}

@JsonSerializable()
class ImageVersions {
  final String large;
  final String medium;
  final String small;
  final String micro;

  ImageVersions({
    required this.large,
    required this.medium,
    required this.small,
    required this.micro,
  });

  factory ImageVersions.fromJson(Map<String, dynamic> json) => _$ImageVersionsFromJson(json);
  Map<String, dynamic> toJson() => _$ImageVersionsToJson(this);
}
