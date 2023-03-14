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
            
          ],
        ),
      ),
    );
  }
}
