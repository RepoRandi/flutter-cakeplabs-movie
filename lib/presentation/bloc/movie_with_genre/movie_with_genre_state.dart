part of 'movie_with_genre_bloc.dart';

@immutable
sealed class MovieWithGenreState {}

final class MovieWithGenreInitial extends MovieWithGenreState {}

final class MovieWithGenreLoading extends MovieWithGenreState {}

final class MovieWithGenreLoaded extends MovieWithGenreState {
  final List<Movie> movies;

  MovieWithGenreLoaded({required this.movies});
}

final class MovieWithGenreError extends MovieWithGenreState {
  final String error;

  MovieWithGenreError({required this.error});
}
