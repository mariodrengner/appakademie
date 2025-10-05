import 'package:design_challenge/app/assets.dart';
import 'package:design_challenge/routes/app_routes.dart';
import 'package:design_challenge/shared/widgets/glass_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '/shared/widgets/glass_chip.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = [
      "All Categories",
      "Salty",
      "Sweet",
      "Spicy",
      "Bitter",
      "Sour",
      "Umami",
    ];
    final List<Map<String, dynamic>> productData = [
      {
        "id": 1,
        "name": "Mogli's Cup",
        "subtitle": "Strawberry ice cream",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl eget aliquam aliquet, nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl.",
        "price": 8.99,
        "image": "assets/images/cupcake_cat.png",
      },
      {
        "id": 2,
        "name": "Balu's Cup",
        "subtitle": "Pistachio ice cream",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl eget aliquam aliquet, nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl.",
        "price": 8.99,
        "image": "assets/images/icecream.png",
      },
      {
        "id": 3,
        "name": "Smiling David",
        "subtitle": "Coffee ice cream",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl eget aliquam aliquet, nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl.",
        "price": 3.99,
        "image": "assets/images/icecream_stick.png",
      },
      {
        "id": 4,
        "name": "Kai in a Cone",
        "subtitle": "A box of cookies",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl eget aliquam aliquet, nisl nisl aliquam nisl, eget aliquam nisl nisl eget nisl.",
        "price": 3.99,
        "image": "assets/images/icecream_cone.png",
      },
    ];

    return Stack(
        children: [
          SvgPicture.asset(AppAssets.bg, alignment: Alignment.topCenter),
          SvgPicture.asset(AppAssets.swoosh, alignment: Alignment.topCenter),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    "Choose Your Favorite \nSnack",
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final label = categories[index];
                      final selected = index == 0;

                      return GlassChip(
                        label: label,
                        selected: selected,
                        onTap: () {
                          debugPrint("Ausgewählt: $label");
                        },
                        borderRadius: BorderRadius.circular(30),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GlassCard(
                        tilted: true,
                        opacity: 0.04,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Angi’s Yummy Burger ', style: theme.textTheme.headlineMedium),
                                Text('Delish vegan burger that tastes like heaven', style: theme.textTheme.headlineSmall),
                                Text('13.99 €'),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: theme.colorScheme.primary,
                                    foregroundColor: theme.colorScheme.onPrimary,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                  onPressed: () {
                                    context.push(AppRoutes.main.path);
                                  },
                                  child: Text('Add to order'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -40, right: 40,
                        child: Image.asset('assets/images/burger.png', width: 200, height: 200)
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('We recommend', style: theme.textTheme.displaySmall),
                ),
                Expanded(
                  // height: 262,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: productData.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 20),
                    itemBuilder: (context, index) {
                      final product = productData[index];
                      final productId = product['id'];

                      return GlassCard(
                        onTap: () {
                          // Nutze push für Drill-Down/Modal Verhalten
                          context.push('${AppRoutes.main.path}/detail/$productId');
                        },
                        opacity: 0.04,
                        child: SizedBox(
                          width: 190,
                          height: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('${product['image']}'),
                              Text('${product['name']}', style: theme.textTheme.headlineMedium),
                              Text('${product['subtitle']}', style: theme.textTheme.bodyMedium),
                              Text('${product['price']} €'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
    );
  }
}
