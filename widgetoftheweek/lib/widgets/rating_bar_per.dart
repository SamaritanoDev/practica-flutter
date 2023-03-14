import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RaBar extends StatelessWidget {
  const RaBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar(
              minRating: 1,
              maxRating: 5,
              initialRating: 3,
              allowHalfRating: true,
              ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  half: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  empty: const Icon(
                    Icons.star,
                    color: Colors.grey,
                  )),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            RatingBar.builder(
              glow: false,
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.heart_broken_rounded,
                color: Colors.red,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ],
        ),
      ),
    );
  }
}
