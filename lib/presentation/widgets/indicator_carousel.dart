import 'package:flutter/material.dart';

class IndicatorCarousel extends StatelessWidget {
  final int currentIndex;
  final int totalItems;
  final double indicatorSize;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  const IndicatorCarousel({
    Key? key,
    required this.currentIndex,
    required this.totalItems,
    this.indicatorSize = 8.0,
    this.spacing = 3.0,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalItems,
        (index) => Container(
          width: currentIndex == index ? 10.0 : indicatorSize,
          height: currentIndex == index ? 10.0 : indicatorSize,
          margin: EdgeInsets.symmetric(horizontal: spacing),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? activeColor : inactiveColor,
          ),
        ),
      ),
    );
  }
}
