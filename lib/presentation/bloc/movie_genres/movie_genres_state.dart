part of 'movie_genres_bloc.dart';

@immutable
sealed class MovieGenresState {}

final class MovieGenresInitial extends MovieGenresState {}

final class MovieGenresLoading extends MovieGenresState {}

final class MovieGenresLoaded extends MovieGenresState {
  final List<Genre> genres;

  MovieGenresLoaded({required this.genres});
}

final class MovieGenresError extends MovieGenresState {
  final String error;

  MovieGenresError({required this.error});
}
