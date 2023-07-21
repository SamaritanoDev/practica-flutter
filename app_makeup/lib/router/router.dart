import 'package:app_makeup/presentation/screens/barbie_mobile_screen.dart';
import 'package:app_makeup/presentation/screens/home_screen.dart';
import 'package:app_makeup/presentation/screens/splash.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home_screen',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/barbie_mobile_screen',
      name: BarbieMobileScreen.name,
      builder: (context, state) => const BarbieMobileScreen(),
    ),
  ],
);
