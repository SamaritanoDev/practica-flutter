import 'package:app_makeup/const/enviroments.dart';
import 'package:app_makeup/presentation/widgets/circle_media.dart';
import 'package:app_makeup/presentation/widgets/custom_text_button.dart';
import 'package:app_makeup/presentation/widgets/wallpaper_gradient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  static const String name = 'loading_screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WallpaperGradient(),
          const CircleMedia(),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 150),
                Text(
                  'Choose',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: 'sofiaRegular',
                        fontSize: 60,
                      ),
                ),
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    logopath,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'outfit',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: 'sofiaRegular',
                        fontSize: 60,
                      ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Column(
                  children: [
                    const _ImagesStack(),
                    CustomTextButton(
                      onPressed: () {
                        GoRouter.of(context).go('/home_screen');
                      },
                    ),
                  ],
                ),
              ],
            ),
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
