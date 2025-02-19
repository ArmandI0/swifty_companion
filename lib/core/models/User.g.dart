// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String?,
  login: json['login'] as String?,
  first_name: json['first_name'] as String?,
  last_name: json['last_name'] as String?,
  usual_full_name: json['usual_full_name'] as String?,
  usual_first_name: json['usual_first_name'] as String?,
  url: json['url'] as String?,
  phone: json['phone'] as String?,
  displayname: json['displayname'] as String?,
  kind: json['kind'] as String?,
  image:
      json['image'] == null
          ? null
          : UserImage.fromJson(json['image'] as Map<String, dynamic>),
  staff: json['staff?'] as bool?,
  correction_point: (json['correction_point'] as num?)?.toInt(),
  pool_month: json['pool_month'] as String?,
  pool_year: json['pool_year'] as String?,
  location: json['location'] as String?,
  wallet: (json['wallet'] as num?)?.toInt(),
  anonymize_date: json['anonymize_date'] as String?,
  data_erasure_date: json['data_erasure_date'] as String?,
  created_at: json['created_at'] as String?,
  updated_at: json['updated_at'] as String?,
  alumnized_at: json['alumnized_at'] as String?,
  alumni: json['alumni?'] as bool?,
  active: json['active?'] as bool?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'login': instance.login,
  'first_name': instance.first_name,
  'last_name': instance.last_name,
  'usual_full_name': instance.usual_full_name,
  'usual_first_name': instance.usual_first_name,
  'url': instance.url,
  'phone': instance.phone,
  'displayname': instance.displayname,
  'kind': instance.kind,
  'image': instance.image,
  'staff?': instance.staff,
  'correction_point': instance.correction_point,
  'pool_month': instance.pool_month,
  'pool_year': instance.pool_year,
  'location': instance.location,
  'wallet': instance.wallet,
  'anonymize_date': instance.anonymize_date,
  'data_erasure_date': instance.data_erasure_date,
  'created_at': instance.created_at,
  'updated_at': instance.updated_at,
  'alumnized_at': instance.alumnized_at,
  'alumni?': instance.alumni,
  'active?': instance.active,
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
