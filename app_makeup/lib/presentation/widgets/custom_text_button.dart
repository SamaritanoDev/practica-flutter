import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 70,
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: 'sofiaRegular',
                        fontSize: 30,
                      ),
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
