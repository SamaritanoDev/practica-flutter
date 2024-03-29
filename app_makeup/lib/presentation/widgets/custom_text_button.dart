import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomTextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 70,
          child: TextButton(
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.white),
            ),
            onPressed: () {
              onPressed();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Started',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontFamily: 'sofiaRegular', fontSize: 30, color: Colors.black),
                ),
                const Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Colors.black,
                  size: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
