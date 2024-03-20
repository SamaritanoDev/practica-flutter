import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class VerticalSlider extends StatefulWidget {
  const VerticalSlider({super.key});

  @override
  State<VerticalSlider> createState() => _VerticalSliderState();
}

class _VerticalSliderState extends State<VerticalSlider> {
  final List<String> imageUrls = [
    "https://i.pinimg.com/564x/75/20/e8/7520e85951488ea9d4d0bc4a556a3dd3.jpg",
    "https://i.pinimg.com/474x/5c/28/d6/5c28d6f461651e40c9037ef5184daa0b.jpg",
    "https://i.pinimg.com/474x/35/b4/49/35b449fc7dc8c402eb107c2928105f5e.jpg",
    "https://i.pinimg.com/474x/58/8d/22/588d22e95ffa5e9ee71c88a0b7a71d4e.jpg",
    "https://i.pinimg.com/474x/68/14/08/681408963196aa90ba22d21f5f5bfea6.jpg",
    "https://i.pinimg.com/474x/1c/b8/db/1cb8db70f70a5eef7b1db6132ccb3127.jpg",
  ];
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CardSwiper(
        cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
          final imageUrl = imageUrls[index];
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: 520,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: const Alignment(0.5, -0.9),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite_border : Icons.favorite,
                    size: 60,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          );
        },
        cardsCount: imageUrls.length,
      ),
    );
  }
}
