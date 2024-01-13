import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardMovieLandscape extends StatelessWidget {
  final String backdropPath;

  const CardMovieLandscape({Key? key, required this.backdropPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500$backdropPath',
          fit: BoxFit.cover,
          placeholder: (context, url) => Image.network(
            'https://i.ibb.co/S32HNjD/no-image.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
