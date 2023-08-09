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
  ],
  errorPageBuilder: (context, state) => const MaterialPage(
    child: Scaffold(
      body: Center(
        child: Text('Página no encontrada'),
      ),
    ),
  ),
);
