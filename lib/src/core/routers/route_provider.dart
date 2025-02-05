import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/home/presentation/pages/insight_page.dart';
import '../../features/main/presentation/pages/main_page.dart';
import '../../features/profile/presentation/pages/user_profile_page.dart';
import 'route_name.dart';

part 'route_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(Ref ref) {
  return GoRouter(
    initialLocation: RouteName.login,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RouteName.login,
        path: '/login',
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        name: RouteName.main,
        path: '/main',
        builder: (context, state) {
          return const MainPage();
        },
      ),
      GoRoute(
        name: RouteName.profile,
        path: '/profile',
        builder: (context, state) {
          final title = state.extra as String;
          return UserProfilePage(
            title: title,
          );
        },
      ),
      GoRoute(
        name: RouteName.insight,
        path: '/insight',
        builder: (context, state) {
          return const InsightPage();
        },
      ),
    ],
  );
}
