import 'package:design_challenge/shared/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '/routes/app_routes.dart';
import '/app/assets.dart';
import '/shared/widgets/glass_card.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Stack(
      children: [
        Image.asset(
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
          AppAssets.bgStart,
        ),
        Transform.translate(
          offset: Offset(size.width * 0.13, size.height * 0.12),
          child: Image.asset(
            width: 540,
            height: 540,
            fit: BoxFit.cover,
            AppAssets.cupCakeChick,
          ),
        ),
        Transform.translate(
          offset: Offset(0, size.height * 0.52),
          child: SvgPicture.asset(
            AppAssets.snackText,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GlassCard(
                opacity: 0.02,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 30.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Feeling Snackish Today?',
                      style: theme.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Explore Angi’s most popular snack selection and get instantly happy.',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: GradientButton(
                            onPressed: () => context.go(AppRoutes.main.path),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Order Now',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 84),
          ],
        ),
      ],
    );
  }
}
