import 'package:app_landing_vertical/config/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainAppRouter extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MainAppRouter({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  State<MainAppRouter> createState() => _MainAppRouterState();
}

class _MainAppRouterState extends State<MainAppRouter> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateInitialLocation();
    });
  }

  void _updateInitialLocation() {
    final initialLocation = _getPageLocation(_pageController.page!.round());
    GoRouter.of(context).go(initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      initialLocation: '/',
      navigatorKey: widget.navigatorKey,
      routes: appRouter.configuration.routes,
    );

    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
    );
  }

  String _getPageLocation(int pageIndex) {
    final matchingMenuItem = appMenuItem.firstWhere(
      (item) => item.index == pageIndex,
      orElse: () => appMenuItem[0],
    );
    return matchingMenuItem.link;
  }
}
