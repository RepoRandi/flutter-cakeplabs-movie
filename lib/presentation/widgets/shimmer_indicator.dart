import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerIndicator extends StatelessWidget {
  final int totalItems;
  final double indicatorSize;
  final double spacing;

  const ShimmerIndicator({
    Key? key,
    required this.totalItems,
    this.indicatorSize = 8.0,
    this.spacing = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalItems,
        (index) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: indicatorSize,
            height: indicatorSize,
            margin: EdgeInsets.symmetric(horizontal: spacing),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
