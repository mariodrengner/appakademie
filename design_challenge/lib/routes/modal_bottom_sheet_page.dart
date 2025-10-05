import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  final Widget child;

  const ModalBottomSheetPage({required this.child, super.key});

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      builder: (context) => child,
      isScrollControlled: true,
      // Page as settings
      settings: this,
    );
  }
}
