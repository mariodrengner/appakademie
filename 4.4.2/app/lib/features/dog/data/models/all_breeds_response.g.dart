// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_breeds_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllBreedsResponse _$AllBreedsResponseFromJson(Map<String, dynamic> json) =>
    AllBreedsResponse(
      message: (json['message'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      status: json['status'] as String,
    );

Map<String, dynamic> _$AllBreedsResponseToJson(AllBreedsResponse instance) =>
    <String, dynamic>{'message': instance.message, 'status': instance.status};
