# Gemini Code Assistant Context

This document provides context for the Gemini code assistant to understand the project structure, conventions, and tasks.

## Project Overview

This is a new and simple Flutter project named "app". The application is a basic "Hello World" app that displays the text in the center of the screen. It uses the Material Design library for its UI components.

The main application logic is located in `lib/main.dart`. The project dependencies are managed in the `pubspec.yaml` file.

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

- **Build the app for Android:**
  ```bash
  flutter build apk
  ```

- **Build the app for iOS:**
  ```bash
  flutter build ios
  ```

## Development Conventions

- **Style:** The project follows the standard Dart and Flutter coding conventions.
- **Linting:** The project uses `flutter_lints` to enforce code quality. See the `analysis_options.yaml` file for linting rules.
- **File Structure:** The project follows the standard Flutter project structure.
- **State Management:** As the project is very simple, it does not currently use a state management library. For more complex features, a state management solution like Provider or BLoC should be considered.
