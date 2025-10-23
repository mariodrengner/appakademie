import 'package:design_challenge/app/assets.dart';
import 'package:design_challenge/app/theme/app_colors.dart';
import 'package:design_challenge/features/main/presentation/widgets/recommended_snacks.dart';
import 'package:design_challenge/shared/widgets/glass_card.dart';
import 'package:design_challenge/shared/widgets/gradient_button.dart';
import 'package:design_challenge/shared/widgets/price_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/shared/widgets/glass_chip.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

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

    return Stack(
      children: [
        Image.asset(
          AppAssets.bgMain,
          alignment: Alignment.topCenter,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
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
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final label = categories[index];
                    final selected = index == _selectedIndex;

                    return GlassChip(
                      label: label,
                      selected: selected,
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        debugPrint("Ausgewählt: $label");
                      },
                      borderRadius: BorderRadius.circular(30),
                      selectedTextColor: const Color.fromRGBO(48, 44, 35, 1),
                      leading: index == 0
                          ? SvgPicture.asset(
                              AppAssets.food,
                              colorFilter: selected
                                  ? const ColorFilter.mode(
                                      Color.fromRGBO(48, 44, 35, 1),
                                      BlendMode.srcIn,
                                    )
                                  : const ColorFilter.mode(
                                      Colors.white70,
                                      BlendMode.srcIn,
                                    ),
                            )
                          : null,
                      trailing: index == 0
                          ? Icon(
                              Icons.keyboard_arrow_down,
                              color: selected
                                  ? const Color.fromRGBO(48, 44, 35, 1)
                                  : Colors.white70,
                              size: 18,
                            )
                          : null,
                    );
                  },
                ),
              ),
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GlassCard(
                        tilted: true,
                        opacity: 0.04,
                        padding: const EdgeInsets.all(20),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Angi’s Yummy Burger ',
                                    style: theme.textTheme.headlineLarge,
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: EdgeInsetsGeometry.only(
                                      right: 180,
                                    ),
                                    child: Text(
                                      'Delish vegan burger that tastes like heaven',
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(color: AppColors.textGrey),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  PriceDisplay(
                                    price: 13.99,
                                    style: theme.textTheme.headlineLarge,
                                  ),
                                  const Spacer(),
                                  GradientButton(
                                    onPressed: () {},
                                    type: GradientButtonType.secondary,
                                    width: 110,
                                    height: 40,
                                    child: Text(
                                      'Add to order',
                                      style: theme.textTheme.labelLarge,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(234, 113, 197, 1),
                                    size: 15,
                                  ),
                                  const SizedBox(width: 4),
                                  Text('4.8'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        right: 0,
                        child: Image.asset(
                          AppAssets.burger,
                          width: 225,
                          height: 225,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              RecommendedSnacks(),
            ],
          ),
        ),
      ],
    );
  }
}
