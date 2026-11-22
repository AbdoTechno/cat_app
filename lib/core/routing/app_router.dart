import 'package:cat_app/app/app_shell.dart';
import 'package:cat_app/features/home/presentation/screens/home_screen.dart';
import 'package:cat_app/features/home/presentation/screens/search_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
      ],
    ),
    // home route
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    // search route
    GoRoute(path: '/search', builder: (context, state) => const SearchScreen()),
  ],
);
