import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Fondo(
        child: CardContainer(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Registrarse',
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
