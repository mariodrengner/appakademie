import '../data/dog_repository.dart';

class DogUsecase {
  DogUsecase(this._dogRepository);

  final DogRepository _dogRepository;

  Future<String> getRandomDogImage() async {
    return _dogRepository.getRandomDogImage();
  }

  Future<Map<String, List<String>>> fetchAllBreeds() async {
    return _dogRepository.fetchAllBreeds();
  }

  Future<String> fetchDogImageByBreed(String breed, [String? subBreed]) async {
    return _dogRepository.fetchDogImageByBreed(breed, subBreed);
  }
}
