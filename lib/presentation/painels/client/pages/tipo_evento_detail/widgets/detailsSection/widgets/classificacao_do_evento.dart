import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ClassificacaoDoEvento extends StatelessWidget {
  const ClassificacaoDoEvento({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      minRating: 1,
      allowHalfRating: true,
      initialRating: 1.4,
      itemSize: 22,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        if (kDebugMode) print(rating);
      },
    );
  }
}
