import 'package:appcupertino/config/router/app_router.dart';
import 'package:appcupertino/widgets/background_curve.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../const/colors.dart';

class LoadingScreen extends StatefulWidget {
  static const String name = 'loading_screen';

  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () => appRouter.go('/login_screen'));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Fondo(
          child: Center(
              child: SizedBox(
            height: size.height / 2,
            child: const Column(
              children: [
                _ImagenLoadin(),
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

class _ImagenLoadin extends StatelessWidget {
  const _ImagenLoadin();

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/loading.png');
  }
}
