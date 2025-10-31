import 'package:json_annotation/json_annotation.dart';

part 'all_breeds_response.g.dart';

@JsonSerializable()
class AllBreedsResponse {
  final Map<String, List<String>> message;
  final String status;

  AllBreedsResponse({required this.message, required this.status});

  factory AllBreedsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllBreedsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllBreedsResponseToJson(this);
}
