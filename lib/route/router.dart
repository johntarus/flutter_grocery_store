import 'package:go_router/go_router.dart';
import 'package:sg_grocery/screens/category/category_screen.dart';
import 'package:sg_grocery/screens/product_detail/product_detail_screen.dart';

import '../components/main_layout.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/onboarding/onboarding_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/payment/payment_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const OnBoardingScreen()),

    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final index =
            int.tryParse(state.uri.queryParameters['tab'] ?? '0') ?? 0;
        return MainLayout(startIndex: index);
      },
      routes: [
        GoRoute(
          path: 'explore',
          builder: (context, state) => const MainLayout(startIndex: 1),
          routes: [
            GoRoute(
              path: 'category',
              builder: (context, state) =>
                  MainLayout(startIndex: 1, child: const CategoryScreen()),
            ),
            GoRoute(
              path: 'details',
              builder: (context, state) =>
                  MainLayout(startIndex: 1, child: const ProductDetailScreen()),
            ),
          ],
        ),
        GoRoute(
          path: 'cart',
          builder: (context, state) =>
              const MainLayout(startIndex: 2, child: CartScreen()),
          routes: [
            GoRoute(
              path: 'payment',
              builder: (context, state) =>
                  const MainLayout(startIndex: 2, child: PaymentScreen()),
            ),
          ],
        ),
      ],
    ),
  ],
);
