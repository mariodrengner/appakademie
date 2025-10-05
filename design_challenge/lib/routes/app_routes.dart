class AppRoute {
  final String path;
  final String title;

  const AppRoute(this.path, this.title);
}

class AppRoutes {
  static const start = AppRoute('/', 'Start');
  static const main = AppRoute('/main', 'Übersicht');
  static const detail = AppRoute('/detail/:id', 'Detail');

  static final Map<String, String> titles = {
    start.path: start.title,
    main.path: main.title,
    detail.path: detail.title,
  };
}
