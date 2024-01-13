part of 'movie_now_playing_bloc.dart';

@immutable
sealed class MovieNowPlayingState {}

final class MovieNowPlayingInitial extends MovieNowPlayingState {}

final class MovieNowPlayingLoading extends MovieNowPlayingState {}

final class MovieNowPlayingLoaded extends MovieNowPlayingState {
  final List<Movie> movies;

  MovieNowPlayingLoaded({required this.movies});
}

final class MovieNowPlayingError extends MovieNowPlayingState {
  final String error;

  MovieNowPlayingError({required this.error});
}
