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
- The main UI and state management are handled within a `StatefulWidget` in `lib/main.dart`.
- API communication logic is separated into a `DogService` class in `lib/dog_service.dart`.
- The project uses the `http` package for making network requests.
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
  - `lib/main.dart`: Main application widget and UI.
  - `lib/dog_service.dart`: Handles all API interactions.
  - `assets/images/`: Contains static image assets.
- **State Management:** The app uses a simple `StatefulWidget` with `setState` for managing its state.
- **Project Planning:** Project progress and tasks are tracked in `PLAN.md`.