import 'package:app_landing_vertical/ui/pages/pages.dart';
import 'package:app_landing_vertical/ui/views/views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Configuración de GoRouter
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/homeview',
      name: HomeView.name,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/contactview',
      name: ContactView.name,
      builder: (context, state) => const ContactView(),
    ),
    GoRoute(
      path: '/locationview',
      name: LocationView.name,
      builder: (context, state) => const LocationView(),
    ),
  ],
  errorPageBuilder: (context, state) => const MaterialPage(
    child: Scaffold(
      body: Center(
        child: Text('Página no encontrada'),
      ),
    ),
  ),
);
