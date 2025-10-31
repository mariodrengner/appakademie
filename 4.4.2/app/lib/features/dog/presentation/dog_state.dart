import 'package:flutter/foundation.dart';

@immutable
sealed class DogState {}

class DogLoading extends DogState {}

class DogData extends DogState {
  DogData(this.imageUrl);

  final String imageUrl;
}

class DogError extends DogState {
  DogError(this.message);

  final String message;
}
