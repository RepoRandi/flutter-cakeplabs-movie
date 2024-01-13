part of 'movie_genres_bloc.dart';

@immutable
sealed class MovieGenresEvent {}

final class LoadMovieGenres extends MovieGenresEvent {}
