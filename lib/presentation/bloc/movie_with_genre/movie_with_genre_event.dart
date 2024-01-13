part of 'movie_with_genre_bloc.dart';

@immutable
sealed class MovieWithGenreEvent {}

final class LoadMovieWithGenre extends MovieWithGenreEvent {
  final int id;

  LoadMovieWithGenre({required this.id});
}
