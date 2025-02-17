// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  login: json['login'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  usualFullName: json['usualFullName'] as String,
  usualFirstName: json['usualFirstName'] as String?,
  url: json['url'] as String,
  phone: json['phone'] as String?,
  displayName: json['displayName'] as String,
  kind: json['kind'] as String,
  image: UserImage.fromJson(json['image'] as Map<String, dynamic>),
  staff: json['staff'] as bool,
  correctionPoint: (json['correctionPoint'] as num).toInt(),
  poolMonth: json['poolMonth'] as String,
  poolYear: (json['poolYear'] as num).toInt(),
  location: json['location'] as String?,
  wallet: (json['wallet'] as num).toInt(),
  anonymizeDate: DateTime.parse(json['anonymizeDate'] as String),
  dataErasureDate: DateTime.parse(json['dataErasureDate'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  alumnizedAt:
      json['alumnizedAt'] == null
          ? null
          : DateTime.parse(json['alumnizedAt'] as String),
  alumni: json['alumni'] as bool,
  active: json['active'] as bool,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'login': instance.login,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'usualFullName': instance.usualFullName,
  'usualFirstName': instance.usualFirstName,
  'url': instance.url,
  'phone': instance.phone,
  'displayName': instance.displayName,
  'kind': instance.kind,
  'image': instance.image,
  'staff': instance.staff,
  'correctionPoint': instance.correctionPoint,
  'poolMonth': instance.poolMonth,
  'poolYear': instance.poolYear,
  'location': instance.location,
  'wallet': instance.wallet,
  'anonymizeDate': instance.anonymizeDate.toIso8601String(),
  'dataErasureDate': instance.dataErasureDate.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'alumnizedAt': instance.alumnizedAt?.toIso8601String(),
  'alumni': instance.alumni,
  'active': instance.active,
};

UserImage _$UserImageFromJson(Map<String, dynamic> json) => UserImage(
  link: json['link'] as String,
  versions: ImageVersions.fromJson(json['versions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserImageToJson(UserImage instance) => <String, dynamic>{
  'link': instance.link,
  'versions': instance.versions,
};

ImageVersions _$ImageVersionsFromJson(Map<String, dynamic> json) =>
    ImageVersions(
      large: json['large'] as String,
      medium: json['medium'] as String,
      small: json['small'] as String,
      micro: json['micro'] as String,
    );

Map<String, dynamic> _$ImageVersionsToJson(ImageVersions instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'micro': instance.micro,
    };
