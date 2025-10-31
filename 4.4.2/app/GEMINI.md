# Gemini Code Assistant Context

This document provides context for the Gemini code assistant to understand the project structure, conventions, and tasks.

## Project Overview

This is a Flutter project named "DigDog". The application connects to the public [Dog CEO API](https://dog.ceo/dog-api/) to fetch and display images of dogs.

**Core Features:**
- Displays a random dog image upon loading and on user request.
- Provides a dropdown menu populated with a list of all dog breeds from the API.
- Allows users to select a breed (or sub-breed) to view a corresponding random image.
- Includes basic loading and error handling states.

**Architecture:**
- The application follows a **Feature-First Architecture** with a clear separation of concerns (Presentation, Domain, Data) for the 'dog' feature.
- State management is handled using `Riverpod`.
- API communication logic is separated into `DogRepository` in `lib/features/dog/data/dog_repository.dart`, utilizing `retrofit` with code generation for API requests.
- Static assets like the app logo are stored in the `assets/images` directory.

## Building and Running

### Prerequisites

- Flutter SDK is installed.
- A configured IDE (like VS Code or Android Studio) with the Flutter plugin.
- A connected device or a running emulator/simulator.

### Key Commands

- **Install dependencies:**
  ```bash
  flutter pub get
  ```

- **Run the app:**
  ```bash
  flutter run
  ```

- **Run tests:**
  ```bash
  flutter test
  ```

## Development Conventions

- **Style:** The project follows the standard Dart and Flutter coding conventions. Code is formatted using `dart format`.
- **Linting:** The project uses `flutter_lints` to enforce code quality. See the `analysis_options.yaml` file for linting rules.
- **File Structure:**
  - `lib/main.dart`: Main application entry point that sets up `ProviderScope` and loads the main `DogScreen`.
  - `lib/features/dog/`: Contains all components related to the dog feature.
    - `lib/features/dog/presentation/dog_screen.dart`: Main UI for displaying dog images and breed selection.
    - `lib/features/dog/presentation/dog_provider.dart`: Riverpod StateNotifier for managing dog-related state.
    - `lib/features/dog/presentation/dog_state.dart`: Sealed class defining dog feature states (loading, data, error).
    - `lib/features/dog/domain/dog_usecase.dart`: Handles business logic, interacting with the repository.
    - `lib/features/dog/data/dog_repository.dart`: Manages API interactions.
    - `lib/features/dog/data/dog_api_service.dart`: Retrofit service definition for the Dog API.
    - `lib/features/dog/data/models/`: Contains data model classes (`dog_response.dart`, `all_breeds_response.dart`).
  - `assets/images/`: Contains static image assets.- **State Management:** The app uses `Riverpod` for managing its state.
- **Project Planning:** Project progress and tasks are tracked in `PLAN.md`.