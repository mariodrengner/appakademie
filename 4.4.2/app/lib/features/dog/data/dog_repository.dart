import 'package:dio/dio.dart';

import 'dog_api_service.dart';

class DogRepository {
  DogRepository() : _dogApiService = DogApiService(Dio());

  final DogApiService _dogApiService;

  Future<String> getRandomDogImage() async {
    final response = await _dogApiService.getRandomDogImage();
    return response.message;
  }

  Future<Map<String, List<String>>> fetchAllBreeds() async {
    final response = await _dogApiService.getAllBreeds();
    return response.message;
  }

  Future<String> fetchDogImageByBreed(String breed, [String? subBreed]) async {
    final response = subBreed != null
        ? await _dogApiService.getDogImageBySubBreed(breed, subBreed)
        : await _dogApiService.getDogImageByBreed(breed);
    return response.message;
  }
}
