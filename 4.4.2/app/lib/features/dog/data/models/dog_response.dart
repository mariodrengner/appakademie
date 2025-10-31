import 'package:json_annotation/json_annotation.dart';

part 'dog_response.g.dart';

@JsonSerializable()
class DogImageResponse {
  final String message;
  final String status;

  DogImageResponse({required this.message, required this.status});

  factory DogImageResponse.fromJson(Map<String, dynamic> json) =>
      _$DogImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DogImageResponseToJson(this);
}
