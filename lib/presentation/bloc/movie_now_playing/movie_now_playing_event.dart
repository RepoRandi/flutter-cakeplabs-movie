part of 'movie_now_playing_bloc.dart';

@immutable
sealed class MovieNowPlayingEvent {}

final class LoadMovieNowPlaying extends MovieNowPlayingEvent {}
