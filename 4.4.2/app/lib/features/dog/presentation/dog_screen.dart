import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers.dart';
import 'dog_provider.dart';
import 'dog_state.dart';

class DogScreen extends ConsumerWidget {
  const DogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dogState = ref.watch(dogProvider);
    final allBreedsAsyncValue = ref.watch(allBreedsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: const Text('DigDog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (dogState is DogLoading)
                const CircularProgressIndicator()
              else if (dogState is DogData)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    dogState.imageUrl,
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const SizedBox(
                        height: 300,
                        width: 300,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 300,
                        width: 300,
                        child: Icon(Icons.error, size: 50),
                      );
                    },
                  ),
                )
              else if (dogState is DogError)
                Text(
                  dogState.message,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20),
              allBreedsAsyncValue.when(
                data: (breeds) {
                  return DropdownButton<String>(
                    value: ref.watch(selectedBreedProvider),
                    hint: const Text('Hunderasse wählen'),
                    isExpanded: true,
                    items: breeds.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      ref.read(selectedBreedProvider.notifier).state = newValue;
                      if (newValue != null) {
                        ref
                            .read(dogProvider.notifier)
                            .fetchDogImageByBreed(newValue);
                      }
                    },
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) =>
                    Text('Fehler beim Laden der Rassen: $error'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: dogState is DogLoading
                    ? null
                    : () =>
                          ref.read(dogProvider.notifier).fetchRandomDogImage(),
                icon: const Icon(Icons.refresh),
                label: const Text('Zufälligen Hund laden'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
