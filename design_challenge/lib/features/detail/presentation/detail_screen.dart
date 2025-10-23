import 'package:design_challenge/app/assets.dart';
import 'package:design_challenge/shared/widgets/price_display.dart';
import 'package:flutter/material.dart';
import 'package:design_challenge/shared/widgets/glass_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:design_challenge/shared/widgets/styled_icon_button.dart';
import 'package:design_challenge/shared/widgets/gradient_button.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _selectedSize = 'Large';
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final price = widget.product['price'];
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    const initialChildSize = 0.98;
    final sheetTop = screenHeight * (1 - initialChildSize);
    const imageTop = -120.0;
    final positionedImageTop = imageTop - sheetTop;

    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: 0.6,
      maxChildSize: 1.0,
      builder: (_, controller) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(AppAssets.bg, fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: positionedImageTop,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      widget.product['image'],
                      width: screenWidth - 20,
                      height: screenWidth - 20,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 140, 30, 40),
                    child: Column(
                      children: [
                        GlassCard(
                          opacity: 0.02,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      widget.product['name'],
                                      style: theme.textTheme.displayMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      widget.product['description'],
                                      style: theme.textTheme.bodyLarge,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    PriceDisplay(
                                      price: widget.product['price'],
                                      style: theme.textTheme.headlineSmall,
                                    ),
                                    const Divider(
                                      color: Colors.white54,
                                      height: 60,
                                      thickness: 0.5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 5,
                                          children: [
                                            Text('Ingredients'),
                                            SizedBox(height: 4),
                                            Row(
                                              spacing: 5,
                                              children: [
                                                Image.asset(
                                                  AppAssets
                                                      .ingredientsGlutenFree,
                                                  height: 19,
                                                  width: 19,
                                                ),
                                                Image.asset(
                                                  AppAssets
                                                      .ingredientsSugarFree,
                                                  height: 19,
                                                  width: 19,
                                                ),
                                                Image.asset(
                                                  AppAssets.ingredientsLowFat,
                                                  height: 19,
                                                  width: 19,
                                                ),
                                                Image.asset(
                                                  AppAssets.ingredientsCalories,
                                                  height: 19,
                                                  width: 19,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 7,
                                          children: [
                                            Text(
                                              'Reviews',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  '4.0',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: -10,
                                  right: 0,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_outline,
                                        color: Colors.white70,
                                        size: 15,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        widget.product['likes'].toString(),
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SegmentedButton<String>(
                              segments: const <ButtonSegment<String>>[
                                ButtonSegment<String>(
                                  value: 'Small',
                                  label: Text('Small'),
                                ),
                                ButtonSegment<String>(
                                  value: 'Medium',
                                  label: Text('Medium'),
                                ),
                                ButtonSegment<String>(
                                  value: 'Large',
                                  label: Text('Large'),
                                ),
                              ],
                              selected: <String>{_selectedSize},
                              onSelectionChanged: (Set<String> newSelection) {
                                setState(() {
                                  _selectedSize = newSelection.first;
                                });
                              },
                              style: SegmentedButton.styleFrom(
                                backgroundColor: const Color(0x3D767680),
                                selectedBackgroundColor: const Color(
                                  0xFF636366,
                                ),
                                foregroundColor: Colors.white,
                                selectedForegroundColor: Colors.white,
                                maximumSize: const Size(100, 26),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),

                                side: const BorderSide(
                                  color: Color(0x3D767680),
                                  width: 1,
                                ),
                                textStyle: theme.textTheme.labelMedium!
                                    .copyWith(height: 1),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 0,
                                ),
                              ),
                              showSelectedIcon: false,
                            ),
                            Row(
                              children: [
                                StyledIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    if (_quantity > 1) {
                                      setState(() {
                                        _quantity--;
                                      });
                                    }
                                  },
                                ),
                                Text(
                                  '$_quantity',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                                StyledIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      _quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        GradientButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add to order for ',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              PriceDisplay(
                                price: price * _quantity,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: StyledIconButton(
                    icon: Icons.close,
                    onPressed: () => context.pop(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
