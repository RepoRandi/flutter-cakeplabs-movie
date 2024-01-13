import 'package:flutter/material.dart';

import 'package:cakeplabs_movie/domain/entities/movie/movie.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_with_genre/movie_with_genre_bloc.dart';
import 'package:cakeplabs_movie/presentation/misc/methods/space.dart';
import 'package:cakeplabs_movie/presentation/widgets/card_movie_portrait.dart';
import 'package:cakeplabs_movie/presentation/widgets/shimmer_card_movie_portrait.dart';
import 'package:cakeplabs_movie/presentation/widgets/text_title.dart';

Widget moviesByGenre(BuildContext context, MovieWithGenreState state) {
  if (state is MovieWithGenreLoading) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitle(text: 'Movies By Genre'),
          verticalSpace(21.0),
          Wrap(
            spacing: 15.0,
            runSpacing: 15.0,
            children: List.generate(
              10,
              (index) {
                double itemWidthFactor =
                    MediaQuery.of(context).size.width < 400 ? 0.47 : 0.48;
                return FractionallySizedBox(
                  widthFactor: itemWidthFactor,
                  child: const ShimmerCardMoviePortrait(),
                );
              },
            ),
          ),
        ],
      ),
    );
  } else if (state is MovieWithGenreError) {
    return Center(
      child: TextTitle(text: state.error),
    );
  } else if (state is MovieWithGenreLoaded) {
    final movies = state.movies;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 15.0),
      child: Wrap(
        spacing: 15.0,
        runSpacing: 15.0,
        children: movies.map((Movie movie) {
          double itemWidthFactor =
              MediaQuery.of(context).size.width < 400 ? 0.47 : 0.48;
          return FractionallySizedBox(
            widthFactor: itemWidthFactor,
            child: CardMoviePortrait(
              posterPath: movie.posterPath ?? '',
              title: movie.title ?? '',
              releaseDate: movie.releaseDate ?? '2023-23-23',
              voteCount: movie.voteCount ?? 0,
            ),
          );
        }).toList(),
      ),
    );
  }
  return const Center(child: TextTitle(text: 'Empty Movie Data'));
}
