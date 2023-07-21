import 'package:app_makeup/presentation/screens/barbie_data_screen.dart';
import 'package:app_makeup/presentation/screens/barbie_designer_screen.dart';
import 'package:app_makeup/presentation/screens/barbie_gamer_screen.dart';
import 'package:app_makeup/presentation/screens/barbie_mobile_screen.dart';
import 'package:app_makeup/presentation/screens/barbie_web_screen.dart';
import 'package:app_makeup/presentation/screens/home_screen.dart';
import 'package:app_makeup/presentation/screens/splash.dart';
import 'package:go_router/go_router.dart';

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
    GoRoute(
      path: '/barbie_web_screen',
      name: BarbieWebScreen.name,
      builder: (context, state) => const BarbieWebScreen(),
    ),
    GoRoute(
      path: '/barbie_data_screen',
      name: BarbieDataScreen.name,
      builder: (context, state) => const BarbieDataScreen(),
    ),
    GoRoute(
      path: '/barbie_gamer_screen',
      name: BarbieGamerScreen.name,
      builder: (context, state) => const BarbieGamerScreen(),
    ),
    GoRoute(
      path: '/barbie_uxui_screen',
      name: BarbieDesignerScreen.name,
      builder: (context, state) => const BarbieDesignerScreen(),
    ),
  ],
);
