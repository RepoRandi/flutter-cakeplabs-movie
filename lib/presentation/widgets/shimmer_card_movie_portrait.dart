import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:cakeplabs_movie/presentation/misc/methods/space.dart';

class ShimmerCardMoviePortrait extends StatelessWidget {
  final double height;

  const ShimmerCardMoviePortrait({Key? key, this.height = 164.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          verticalSpace(12.0),
          Container(
            width: double.infinity,
            height: 14.0,
            color: Colors.white,
          ),
          verticalSpace(12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80.0,
                height: 12.0,
                color: Colors.white,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.thumb_up_alt_outlined,
                    color: Colors.white,
                  ),
                  horizontalSpace(5.0),
                  Container(
                    width: 30.0,
                    height: 12.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
