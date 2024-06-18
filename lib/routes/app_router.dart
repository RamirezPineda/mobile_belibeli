import 'package:app_belibeli/screens/login/login.screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const root = '/';
  static const login = '/login';

  static GoRouter getRoutes() {
    return GoRouter(routes: [
      GoRoute(
        path: Routes.root,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
    ]);
  }
}
