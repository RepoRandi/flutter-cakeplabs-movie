import 'package:cakeplabs_movie/domain/entities/genre/genre.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_genres/movie_genres_bloc.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_with_genre/movie_with_genre_bloc.dart';
import 'package:cakeplabs_movie/presentation/widgets/circle_genre.dart';
import 'package:cakeplabs_movie/presentation/widgets/shimmer_circle_genre.dart';
import 'package:cakeplabs_movie/presentation/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget genreList(BuildContext context, MovieGenresState state,
    int selectedGenreIndex, Function(int) updateSelectedGenre) {
  if (state is MovieGenresLoading) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 23),
      child: SizedBox(
        height: 80,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            10,
            (index) => const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: ShimmerCircleGenre(),
            ),
          ),
        ),
      ),
    );
  } else if (state is MovieGenresError) {
    return Center(
      child: TextTitle(text: state.error),
    );
  } else if (state is MovieGenresLoaded) {
    final genres = state.genres;
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          Genre? genre = genres[index];
          return GestureDetector(
            onTap: () {
              updateSelectedGenre(index);
              context
                  .read<MovieWithGenreBloc>()
                  .add(LoadMovieWithGenre(id: genre.id));
            },
            child: Container(
              margin: EdgeInsets.only(
                  right: index == genres.length - 1 ? 0.0 : 15.0,
                  left: index == 0 ? 16.0 : 0.0,
                  bottom: 23.0),
              child: CircleGenre(
                isSelected: selectedGenreIndex == index,
                genreName: genre.name,
              ),
            ),
          );
        },
      ),
    );
  }
  return const Center(child: TextTitle(text: 'Empty Genres Data'));
}
