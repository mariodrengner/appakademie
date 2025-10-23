import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  final Widget child;
  final Color? backgroundColor;

  const ModalBottomSheetPage({
    required this.child,
    this.backgroundColor,
    super.key,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: child,
        );
      },
      backgroundColor: backgroundColor,
      isScrollControlled: true,
      // Page as settings
      settings: this,
    );
  }
}
