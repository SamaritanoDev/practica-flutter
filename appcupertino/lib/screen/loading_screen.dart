import 'package:appcupertino/widgets/background_curve.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Fondo(
          child: Center(
              child: SizedBox(
            height: 300,
            child: Column(
              children: const [
                ImagenLoadin(),
                SizedBox(height: 5),
                CircularProgressIndicator(
                  color: ColorsMyApp.secondarycolor,
                ),
              ],
            ),
          )),
        ));
  }
}

class ImagenLoadin extends StatelessWidget {
  const ImagenLoadin({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/loading.png');
  }
}
