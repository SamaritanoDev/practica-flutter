import 'package:app_makeup/presentation/widgets/vertical_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BarbieMobileScreen extends StatelessWidget {
  static const String name = '/barbie_mobile_screen';
  const BarbieMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            GoRouter.of(context).go('/home_screen');
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Outfit for Barbie\nMobile Developer',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'sofiaRegular',
                      fontSize: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          const VerticalSlider(),
        ],
      ),
    );
  }
}
