import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../assets.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppAssets.bg, alignment: Alignment.topCenter),
        SvgPicture.asset(AppAssets.swoosh, alignment: Alignment.topCenter),
      ]
    );
  }
}
