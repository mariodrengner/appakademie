import 'package:riverpod/riverpod.dart';

import '../domain/dog_usecase.dart';
import 'dog_state.dart';
import 'package:app/providers.dart';

final dogProvider = StateNotifierProvider<DogNotifier, DogState>((ref) {
  return DogNotifier(ref.watch(dogUsecaseProvider));
});

class DogNotifier extends StateNotifier<DogState> {
  DogNotifier(this._dogUsecase) : super(DogLoading()) {
    fetchRandomDogImage();
  }

  final DogUsecase _dogUsecase;

  Future<void> fetchRandomDogImage() async {
    state = DogLoading();
    try {
      final imageUrl = await _dogUsecase.getRandomDogImage();
      state = DogData(imageUrl);
    } catch (e) {
      state = DogError('Failed to fetch dog image');
    }
  }

  Future<void> fetchDogImageByBreed(String breedSelection) async {
    state = DogLoading();
    try {
      String breed;
      String? subBreed;
      if (breedSelection.contains('(')) {
        final parts = breedSelection.replaceAll(')', '').split(' (');
        breed = parts[0];
        subBreed = parts[1];
      } else {
        breed = breedSelection;
      }
      final imageUrl = await _dogUsecase.fetchDogImageByBreed(breed, subBreed);
      state = DogData(imageUrl);
    } catch (e) {
      state = DogError('Failed to fetch dog image for $breedSelection');
    }
  }
}
