import 'package:cakeplabs_movie/data/tmdb/tmdb_movie_repository.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_genres/movie_genres_bloc.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_with_genre/movie_with_genre_bloc.dart';
import 'package:cakeplabs_movie/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieNowPlayingBloc>(
          create: (context) =>
              MovieNowPlayingBloc(movieRepository: TmdbMovieRepository()),
        ),
        BlocProvider<MovieGenresBloc>(
          create: (context) =>
              MovieGenresBloc(movieRepository: TmdbMovieRepository()),
        ),
        BlocProvider<MovieWithGenreBloc>(
          create: (context) =>
              MovieWithGenreBloc(movieRepository: TmdbMovieRepository()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cakeplabs Movie',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
