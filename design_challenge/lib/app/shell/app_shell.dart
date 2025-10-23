import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_background.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  final GoRouterState shellState;
  const AppShell({super.key, required this.child, required this.shellState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [const AppBackground(), child]),
    );
  }
}
