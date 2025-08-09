import 'package:go_router/go_router.dart';

import '../components/main_layout.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/onboarding/onboarding_screen.dart';
import '../screens/auth/register_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const OnBoardingScreen()),

    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const RegisterScreen(),
    ),
    // GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/home', builder: (context, state) => const MainLayout()),
  ],
);
