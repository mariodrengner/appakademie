import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'shell/app_shell.dart';
import '../features/start/presentation/start_screen.dart';
import '../features/main/presentation/main_screen.dart';
import '../features/detail/presentation/detail_screen.dart';
import '../routes/app_routes.dart';
import '../routes/modal_bottom_sheet_page.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            AppShell(shellState: state, child: child),
        routes: [
          GoRoute(
            path: AppRoutes.start.path,
            builder: (_, _) => const StartScreen(),
          ),
          GoRoute(
            path: AppRoutes.main.path,
            builder: (_, _) => const MainScreen(),
            routes: [
              GoRoute(
                path: 'detail/:id',
                // pageBuilder instead of builder
                pageBuilder: (context, state) {
                  final product = state.extra as Map<String, dynamic>;
                  // show DetailScreen as modal
                  return ModalBottomSheetPage(
                    key: state.pageKey, // für GoRouter
                    backgroundColor: Colors.transparent,
                    child: DetailScreen(product: product),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
