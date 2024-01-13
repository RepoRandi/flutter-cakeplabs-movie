import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cakeplabs_movie/presentation/bloc/movie_genres/movie_genres_bloc.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_with_genre/movie_with_genre_bloc.dart';
import 'package:cakeplabs_movie/presentation/pages/home/methods/genre_list.dart';
import 'package:cakeplabs_movie/presentation/pages/home/methods/movies_by_genre.dart';
import 'package:cakeplabs_movie/presentation/pages/home/methods/now_playing_movies.dart';
import 'package:cakeplabs_movie/presentation/widgets/text_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarouselIndex = 0;
  int _selectedGenreIndex = 0;

  void updateCurrentCarousel(int index) {
    setState(() {
      _currentCarouselIndex = index;
    });
  }

  void updateSelectedGenre(int index) {
    setState(() {
      _selectedGenreIndex = index;
    });
  }

  @override
  void initState() {
    context.read<MovieNowPlayingBloc>().add(LoadMovieNowPlaying());
    context.read<MovieGenresBloc>().add(LoadMovieGenres());
    context.read<MovieWithGenreBloc>().add(LoadMovieWithGenre(id: 28));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'The Movie List',
          style: GoogleFonts.mulish(fontSize: 20.0),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 19.0, 0, 15),
            child: TextTitle(text: 'Now Playing Movies'),
          ),
          BlocBuilder<MovieNowPlayingBloc, MovieNowPlayingState>(
            builder: (context, state) {
              return nowPlayingMovies(
                  context, state, _currentCarouselIndex, updateCurrentCarousel);
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 15),
            child: TextTitle(text: 'Genre List'),
          ),
          BlocBuilder<MovieGenresBloc, MovieGenresState>(
            builder: (context, state) {
              return genreList(
                  context, state, _selectedGenreIndex, updateSelectedGenre);
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 21.0),
            child: TextTitle(text: 'Movies By Genre'),
          ),
          BlocBuilder<MovieWithGenreBloc, MovieWithGenreState>(
            builder: (context, state) {
              return moviesByGenre(context, state);
            },
          ),
        ],
      ),
    );
  }
}
