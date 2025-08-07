import 'package:go_router/go_router.dart';

import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/onboarding_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const OnBoardingScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
  ],
);
