import 'package:app_landing_vertical/ui/pages/pages.dart';
import 'package:app_landing_vertical/ui/views/views.dart';
import 'package:go_router/go_router.dart';

class RouteConfiguration {
  static final List<GoRoute> routes = [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactView(),
    ),
    GoRoute(
      path: '/locationview',
      builder: (context, state) => const LocationView(),
    ),
  ];
}
