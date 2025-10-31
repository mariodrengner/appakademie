import 'package:riverpod/riverpod.dart';

import 'features/dog/data/dog_repository.dart';
import 'features/dog/domain/dog_usecase.dart';

final dogRepositoryProvider = Provider((ref) => DogRepository());

final dogUsecaseProvider = Provider(
  (ref) => DogUsecase(ref.watch(dogRepositoryProvider)),
);

final allBreedsProvider = FutureProvider<List<String>>((ref) async {
  final dogUsecase = ref.watch(dogUsecaseProvider);
  final breedsMap = await dogUsecase.fetchAllBreeds();
  final List<String> breedsList = [];
  breedsMap.forEach((breed, subBreeds) {
    if (subBreeds.isEmpty) {
      breedsList.add(breed);
    } else {
      for (var subBreed in subBreeds) {
        breedsList.add('$breed ($subBreed)');
      }
    }
  });
  return breedsList;
});

final selectedBreedProvider = StateProvider<String?>((ref) => null);
