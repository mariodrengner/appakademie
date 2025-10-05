import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '/routes/app_routes.dart';
import '/app/assets.dart';
import '/app/theme/app_fonts.dart';
import '/shared/widgets/glass_card.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Stack(
      children: [
        Text('SNACK', style: theme.textTheme.displayLarge),
        Transform.translate(
          offset: Offset(size.width * 0.13, size.height * 0.1),
          child: Image.asset(width: 540, height: 540, fit: BoxFit.cover, AppAssets.cupCakeChick),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GlassCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Feeling Snackish Today?', style: theme.textTheme.displayMedium),
                  Text('Explore Angi’s most popular snack selection and get instantly happy.', style: theme.textTheme.headlineSmall),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      context.push(AppRoutes.main.path);
                    },
                    child: Text('Order Now'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
