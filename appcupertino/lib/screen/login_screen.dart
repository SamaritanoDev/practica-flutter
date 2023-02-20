import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Fondo(
        child: CardContainer(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Iniciar sesión',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
