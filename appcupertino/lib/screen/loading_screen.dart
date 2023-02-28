import 'package:appcupertino/screen/screens.dart';
import 'package:appcupertino/widgets/background_curve.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../const/colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RegisterScreen())));
  }

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
