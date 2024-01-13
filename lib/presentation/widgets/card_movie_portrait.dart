import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cakeplabs_movie/presentation/misc/extensions/formatted_date.dart';
import 'package:cakeplabs_movie/presentation/misc/methods/space.dart';

class CardMoviePortrait extends StatelessWidget {
  final String posterPath;
  final String title;
  final String releaseDate;
  final int voteCount;

  const CardMoviePortrait({
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.voteCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            height: 164,
            width: double.infinity,
            imageUrl: 'https://image.tmdb.org/t/p/w500$posterPath',
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
        verticalSpace(12.0),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.mulish(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              releaseDate.formattedDate(),
              style: GoogleFonts.mulish(
                fontSize: 12,
                color: const Color(0XFF8B8B8B),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.thumb_up_alt_outlined,
                ),
                horizontalSpace(5.0),
                Text(
                  '$voteCount',
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    color: const Color(0XFF8B8B8B),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
