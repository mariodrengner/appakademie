import 'package:flutter/material.dart';

class AppGradients {
  // Button Gradients
  static const Gradient buttonPrimaryRadial = RadialGradient(
    center: Alignment(0.9, 0.4),
    radius: 2.0,
    colors: [
      Color.fromRGBO(246, 158, 163, 1),
      Color.fromRGBO(233, 112, 196, 1),
    ],
  );

  static const Gradient buttonPrimaryLinearOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(254, 200, 241, 1),
      Color.fromRGBO(237, 146, 215, 0),
    ],
    stops: [0.0, 0.4],
  );

  static const Gradient buttonSecondaryRadial = RadialGradient(
    center: Alignment(0.9, 0.4),
    radius: 2.0,
    colors: [
      Color.fromRGBO(144, 140, 245, 1),
      Color.fromRGBO(187, 141, 225, 1),
    ],
  );

  static const Gradient buttonSecondaryLinearOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(254, 200, 241, 1),
      Color.fromRGBO(237, 146, 215, 0),
    ],
    stops: [0.0, 0.4],
  );

  static const Gradient buttonBorder = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0x80000000), Color(0x80FFFFFF)],
    transform: GradientRotation(0.26), // 14.89 degrees
  );
}
