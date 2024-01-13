import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircleGenre extends StatelessWidget {
  const ShimmerCircleGenre({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: CircleAvatar(
        radius: 42.0,
        backgroundColor: Colors.grey[300],
        child: CircleAvatar(
          radius: 38.0,
          backgroundColor: Colors.white,
          child: Text(
            'Genre',
            style: TextStyle(fontSize: 10, color: Colors.grey[300]),
          ),
        ),
      ),
    );
  }
}
