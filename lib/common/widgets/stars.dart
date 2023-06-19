import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget {
  final double rating;
  final double size;
  const Stars({super.key, required this.rating, required this.size});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: rating,
      itemSize: size,
      itemBuilder: (context, index) {
        return const Icon(
          CupertinoIcons.star_fill,
          color: Colors.deepPurple,
        );
      },
    );
  }
}
