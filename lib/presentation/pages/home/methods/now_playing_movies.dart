import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:cakeplabs_movie/domain/entities/movie/movie.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:cakeplabs_movie/presentation/misc/methods/space.dart';
import 'package:cakeplabs_movie/presentation/widgets/card_movie_landscape.dart';
import 'package:cakeplabs_movie/presentation/widgets/indicator_carousel.dart';
import 'package:cakeplabs_movie/presentation/widgets/shimmer_card_movie_landscape.dart';
import 'package:cakeplabs_movie/presentation/widgets/shimmer_indicator.dart';
import 'package:cakeplabs_movie/presentation/widgets/text_title.dart';

Widget nowPlayingMovies(BuildContext context, MovieNowPlayingState state,
    int currentCarouselIndex, Function(int) updateCurrentCarousel) {
  if (state is MovieNowPlayingLoading) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 15.0),
      child: Column(
        children: [
          const ShimmerCardMovieLandscape(),
          verticalSpace(16),
          const ShimmerIndicator(totalItems: 18)
        ],
      ),
    );
  } else if (state is MovieNowPlayingError) {
    return Center(
      child: TextTitle(text: state.error),
    );
  } else if (state is MovieNowPlayingLoaded) {
    final movies = state.movies;
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: movies.length,
          options: CarouselOptions(
            height: 130.0,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              updateCurrentCarousel(index);
            },
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            Movie movie = movies[index];
            return CardMovieLandscape(
                backdropPath: movie.backdropPath ?? movie.posterPath!);
          },
        ),
        verticalSpace(16),
        IndicatorCarousel(
            currentIndex: currentCarouselIndex, totalItems: movies.length),
      ],
    );
  }
  return const Center(child: TextTitle(text: 'Empty Movie Data'));
}
