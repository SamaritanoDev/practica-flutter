import 'package:app_makeup/const/data.dart';
import 'package:app_makeup/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'What Barbie are you?',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: 'sofiaRegular',
                    fontSize: 30,
                  ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: imagePathTypeBarbie.length,
                  itemBuilder: (context, index) {
                    return CustomCard(barbie: imagePathTypeBarbie[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
