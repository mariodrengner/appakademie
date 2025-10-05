import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient primary = LinearGradient(
    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient success = LinearGradient(
    colors: [Color(0xFF00C853), Color(0xFFB2FF59)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const RadialGradient background = RadialGradient(
    colors: [Color(0xFFFFFDE7), Color(0xFFFFF59D)],
    center: Alignment.center,
    radius: 1.0,
  );
}

// /* Card */

// box-sizing: border-box;

// /* Auto layout */
// display: flex;
// flex-direction: column;
// justify-content: center;
// align-items: center;
// padding: 90px;
// gap: 90px;

// position: absolute;
// width: 1020px;
// height: 624px;
// left: calc(50% - 1020px/2);
// top: 1656px;

// background: rgba(255, 255, 255, 0.01);
// border: 3px solid rgba(255, 255, 255, 0.3);
// backdrop-filter: blur(45px);
// /* Note: backdrop-filter has minimal browser support */
// border-radius: 90px;
