import 'package:flutter/material.dart';
import 'dog_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final DogService _dogService = DogService();
  String? _imageUrl;
  bool _isLoading = false;
  final List<String> _breeds = [];
  String? _selectedBreed;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await _loadBreeds();
    await _loadRandomDog();
  }

  Future<void> _loadBreeds() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final breedsMap = await _dogService.fetchAllBreeds();
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
      setState(() {
        _breeds.clear();
        _breeds.addAll(breedsList);
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load breeds. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadRandomDog() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final imageUrl = await _dogService.fetchRandomDogImage();
      setState(() {
        _imageUrl = imageUrl;
        _selectedBreed = null;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load image. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadDogByBreed(String? breedSelection) async {
    if (breedSelection == null) return;

    setState(() {
      _isLoading = true;
      _selectedBreed = breedSelection;
      _error = null;
    });

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

      final imageUrl = await _dogService.fetchDogImageByBreed(breed, subBreed);
      setState(() {
        _imageUrl = imageUrl;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load image for $_selectedBreed. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
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
                if (_error != null)
                  Text(
                    _error!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                if (_isLoading)
                  const CircularProgressIndicator()
                else if (_imageUrl != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      _imageUrl!,
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
                else if (_error == null)
                  const Text('Kein Bild geladen'),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  value: _selectedBreed,
                  hint: const Text('Hunderasse wählen'),
                  isExpanded: true,
                  items: _breeds.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: _loadDogByBreed,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _loadRandomDog,
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
      ),
    );
  }
}
