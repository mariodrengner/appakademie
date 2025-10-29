import 'dart:convert';
import 'package:http/http.dart';

class DogService {
  static const String _baseUrl = 'https://dog.ceo/api';

  Future<String> fetchRandomDogImage() async {
    final response = await get(Uri.parse('$_baseUrl/breeds/image/random'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw Exception('Failed to load random dog image');
    }
  }

  Future<Map<String, List<String>>> fetchAllBreeds() async {
    final response = await get(Uri.parse('$_baseUrl/breeds/list/all'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body)['message'];
      return data.map((key, value) => MapEntry(key, List<String>.from(value)));
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  Future<String> fetchDogImageByBreed(String breed, [String? subBreed]) async {
    String url;
    if (subBreed != null) {
      url = '$_baseUrl/breed/$breed/$subBreed/images/random';
    } else {
      url = '$_baseUrl/breed/$breed/images/random';
    }
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw Exception('Failed to load image for breed $breed');
    }
  }
}
