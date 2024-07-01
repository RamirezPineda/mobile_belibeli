import 'package:go_router/go_router.dart';
import 'package:app_belibeli/screens/screens.dart';

class Routes {
  static const root = '/';
  static const login = '/login';
  static const product = '/product';

  static GoRouter getRoutes() {
    return GoRouter(
      initialLocation: login,
      routes: [
        GoRoute(
          path: root,
          builder: (context, state) => const InitScreen(),
        ),
        GoRoute(
          path: login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '$product/:id',
          builder: (context, state) => ProductScreen(
            id: state.pathParameters['id'],
          ),
        ),
      ],
    );
  }
}
