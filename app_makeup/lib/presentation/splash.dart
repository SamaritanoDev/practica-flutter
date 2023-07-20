import 'package:app_makeup/const/enviroments.dart';
import 'package:app_makeup/presentation/widgets/circle_media.dart';
import 'package:app_makeup/presentation/widgets/custom_text_button.dart';
import 'package:app_makeup/presentation/widgets/wallpaper_gradient.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WallpaperGradient(),
          const CircleMedia(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 150),
              Text(
                'Your Skin',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'sofiaRegular',
                      fontSize: 60,
                    ),
              ),
              Text(
                'Breathe',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'sofiaRegular',
                      fontSize: 60,
                    ),
              ),
              const SizedBox(
                height: 150,
              ),
              const Column(
                children: [
                  _ImagesStack(),
                  CustomTextButton(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ImagesStack extends StatelessWidget {
  const _ImagesStack();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: 200,
          height: 300,
          child: Image.asset(
            imagethree,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          alignment: const Alignment(0, -3),
          width: 200,
          height: 300,
          child: Image.asset(
            imagetwo,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
