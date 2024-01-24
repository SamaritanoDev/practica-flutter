import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String emoji;
  final String prefix;
  final String value;

  const TextRow({
    Key? key,
    required this.emoji,
    required this.prefix,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          prefix,
          style: textTheme.titleLarge?.copyWith(color: const Color(0xffF5907C)),
        ),
        Text(emoji),
        Text(value, style: textTheme.bodyLarge),
      ],
    );
  }
}
