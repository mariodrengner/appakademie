import 'package:flutter/material.dart';
import 'dart:ui';

class GlassChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final double borderWidth;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final Widget? trailing;
  final Color? selectedTextColor;

  const GlassChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.borderWidth = 1.5,
    this.borderRadius,
    this.leading,
    this.trailing,
    this.selectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final br = borderRadius ?? BorderRadius.circular(30);
    final textColor = selected
        ? selectedTextColor
        : Colors.white.withValues(alpha: 0.6);

    return ClipRRect(
      borderRadius: br,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: br,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.5),
              width: borderWidth,
            ),
          ),
          child: Material(
            color: selected
                ? Colors.white.withValues(alpha: 0.7)
                : Colors.white.withValues(alpha: 0.15),
            borderRadius: br,
            child: InkWell(
              onTap: onTap,
              splashColor: Colors.white.withValues(alpha: 0.1),
              highlightColor: Colors.white.withValues(alpha: 0.05),
              customBorder: RoundedRectangleBorder(borderRadius: br),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leading != null) ...[
                      IconTheme(
                        data: IconThemeData(color: textColor, size: 12),
                        child: leading!,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      label,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    if (trailing != null) ...[
                      const SizedBox(width: 8),
                      IconTheme(
                        data: IconThemeData(color: textColor, size: 12),
                        child: trailing!,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
