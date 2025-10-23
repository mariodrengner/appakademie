import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final bool tilted; // use SVG-shape
  final double blurSigma;
  final double opacity;
  final double borderOpacity;
  final double borderWidth;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Decoration? decoration;

  const GlassCard({
    super.key,
    required this.child,
    this.tilted = false,
    this.blurSigma = 20.0,
    this.opacity = 0.02,
    this.borderOpacity = 0.5,
    this.borderWidth = 1.5,
    this.borderRadius,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Color.fromARGB((opacity * 255).round(), 255, 255, 255);
    final borderColor = Color.fromARGB(
      (borderOpacity * 255).round(),
      255,
      255,
      255,
    );
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(24);

    Widget contentLayer = Padding(padding: padding, child: child);

    if (onTap != null) {
      contentLayer = Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: tilted ? null : effectiveBorderRadius,
          child: contentLayer,
        ),
      );
    }

    Widget glassStack = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
      child: Container(
        alignment: Alignment.center,
        color: bgColor,
        child: Container(decoration: decoration, child: contentLayer),
      ),
    );

    if (tilted) {
      return _TiltedWrapper(
        borderColor: borderColor,
        borderWidth: borderWidth,
        child: glassStack,
      );
    } else {
      return ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: Stack(
          children: [
            glassStack,
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: _RectBorderPainter(
                    borderColor: borderColor,
                    borderWidth: borderWidth,
                    borderRadius: effectiveBorderRadius,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _TiltedWrapper extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth;

  const _TiltedWrapper({
    required this.child,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipPath(
          clipper: _SvgGlassTiltClipper(),
          child: Stack(
            children: [
              child,
              Positioned.fill(
                child: IgnorePointer(
                  child: CustomPaint(
                    painter: _SvgBorderPainter(
                      borderColor: borderColor,
                      borderWidth: borderWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SvgBorderPainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;

  _SvgBorderPainter({required this.borderColor, required this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final path = _SvgGlassTiltClipper().getClip(size);
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..isAntiAlias = true
      ..blendMode = BlendMode.overlay;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SvgBorderPainter old) =>
      old.borderColor != borderColor || old.borderWidth != borderWidth;
}

/// Painter for regular rounded rect border
class _RectBorderPainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;
  final BorderRadius borderRadius;

  _RectBorderPainter({
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = borderRadius.toRRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..isAntiAlias = true
      ..blendMode = BlendMode.overlay;
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _RectBorderPainter old) =>
      old.borderColor != borderColor ||
      old.borderWidth != borderWidth ||
      old.borderRadius != borderRadius;
}

class _SvgGlassTiltClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Original SVG viewBox dimensions
    const double svgWidth = 1051.0;
    const double svgHeight = 710.0;

    // Scaling
    final double sx = size.width / svgWidth;
    final double sy = size.height / svgHeight;

    final Path path = Path();
    double currentX = 0;
    double currentY = 0;

    // SVG Command: M .727 90.147
    currentX = 0.727;
    currentY = 90.147;
    path.moveTo(currentX * sx, currentY * sy);

    // SVG Command: c 0-49.706 40.294-90 90-90
    var x1 = currentX + 0;
    var y1 = currentY - 49.706;
    var x2 = currentX + 40.294;
    var y2 = currentY - 90;
    var x3 = currentX + 90;
    var y3 = currentY - 90;
    path.cubicTo(x1 * sx, y1 * sy, x2 * sx, y2 * sy, x3 * sx, y3 * sy);
    currentX = x3;
    currentY = y3;

    // SVG Command: h 870
    currentX += 870;
    path.lineTo(currentX * sx, currentY * sy);

    // SVG Command: c 49.703 0 90.003 40.294 90.003 90
    x1 = currentX + 49.703;
    y1 = currentY + 0;
    x2 = currentX + 90.003;
    y2 = currentY + 40.294;
    x3 = currentX + 90.003;
    y3 = currentY + 90;
    path.cubicTo(x1 * sx, y1 * sy, x2 * sx, y2 * sy, x3 * sx, y3 * sy);
    currentX = x3;
    currentY = y3;

    // SVG Command: v 429.699
    currentY += 429.699;
    path.lineTo(currentX * sx, currentY * sy);

    // SVG Command: c 0 45.752-34.33 84.223-79.784 89.418
    x1 = currentX + 0;
    y1 = currentY + 45.752;
    x2 = currentX - 34.33;
    y2 = currentY + 84.223;
    x3 = currentX - 79.784;
    y3 = currentY + 89.418;
    path.cubicTo(x1 * sx, y1 * sy, x2 * sx, y2 * sy, x3 * sx, y3 * sy);
    currentX = x3;
    currentY = y3;

    // SVG Command: l -870 99.429
    currentX -= 870;
    currentY += 99.429;
    path.lineTo(currentX * sx, currentY * sy);

    // SVG Command: C 47.539 714.796 .726 673.029 .726 619.275
    path.cubicTo(
      47.539 * sx,
      714.796 * sy,
      0.726 * sx,
      673.029 * sy,
      0.726 * sx,
      619.275 * sy,
    );
    currentX = 0.726;
    currentY = 619.275;

    // SVG Command: V 90.146
    currentY = 90.146;
    path.lineTo(currentX * sx, currentY * sy);

    // SVG Command: Z
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
