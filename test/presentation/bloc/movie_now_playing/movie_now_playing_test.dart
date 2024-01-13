import 'package:bloc_test/bloc_test.dart';
import 'package:cakeplabs_movie/data/repositories/movie/movie_repository.dart';
import 'package:cakeplabs_movie/domain/entities/movie/movie.dart';
import 'package:cakeplabs_movie/domain/entities/result/result.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  group('MovieNowPlayingBloc', () {
    late MockMovieRepository mockMovieRepository;
    late MovieNowPlayingBloc movieNowPlayingBloc;

    setUp(() {
      mockMovieRepository = MockMovieRepository();
      movieNowPlayingBloc =
          MovieNowPlayingBloc(movieRepository: mockMovieRepository);
    });

    tearDown(() {
      movieNowPlayingBloc.close();
    });

    blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
      'emits [MovieNowPlayingLoading, MovieNowPlayingLoaded] when LoadMovieNowPlaying is added and successful',
      build: () {
        when(() => mockMovieRepository.getMovieNowPlaying())
            .thenAnswer((_) async => const Result.success(<Movie>[]));
        return movieNowPlayingBloc;
      },
      act: (bloc) => bloc.add(LoadMovieNowPlaying()),
      expect: () => [
        isA<MovieNowPlayingLoading>(),
        isA<MovieNowPlayingLoaded>(),
      ],
    );

    blocTest<MovieNowPlayingBloc, MovieNowPlayingState>(
      'emits [MovieNowPlayingLoading, MovieNowPlayingError] when LoadMovieNowPlaying fails',
      build: () {
        when(() => mockMovieRepository.getMovieNowPlaying()).thenAnswer(
            (_) async =>
                const Result.failed('Failed to load now playing movies'));
        return movieNowPlayingBloc;
      },
      act: (bloc) => bloc.add(LoadMovieNowPlaying()),
      expect: () => [
        isA<MovieNowPlayingLoading>(),
        isA<MovieNowPlayingError>(),
      ],
    );
  });
}
