import 'package:bloc_test/bloc_test.dart';
import 'package:cakeplabs_movie/data/repositories/movie/movie_repository.dart';
import 'package:cakeplabs_movie/domain/entities/movie/movie.dart';
import 'package:cakeplabs_movie/domain/entities/result/result.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_with_genre/movie_with_genre_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  group('MovieWithGenreBloc', () {
    late MockMovieRepository mockMovieRepository;
    late MovieWithGenreBloc movieWithGenreBloc;

    setUp(() {
      mockMovieRepository = MockMovieRepository();
      movieWithGenreBloc =
          MovieWithGenreBloc(movieRepository: mockMovieRepository);
    });

    tearDown(() {
      movieWithGenreBloc.close();
    });

    blocTest<MovieWithGenreBloc, MovieWithGenreState>(
      'emits [MovieWithGenreLoading, MovieWithGenreLoaded] when LoadMovieWithGenre is added and successful',
      build: () {
        when(() => mockMovieRepository.getMovieWithGenre(id: any(named: 'id')))
            .thenAnswer((_) async => const Result.success(<Movie>[]));
        return movieWithGenreBloc;
      },
      act: (bloc) => bloc.add(LoadMovieWithGenre(id: 28)),
      expect: () => [
        isA<MovieWithGenreLoading>(),
        isA<MovieWithGenreLoaded>(),
      ],
    );

    blocTest<MovieWithGenreBloc, MovieWithGenreState>(
      'emits [MovieWithGenreLoading, MovieWithGenreError] when LoadMovieWithGenre fails',
      build: () {
        when(() => mockMovieRepository.getMovieWithGenre(id: any(named: 'id')))
            .thenAnswer((_) async =>
                const Result.failed('Failed to load movies with genre'));
        return movieWithGenreBloc;
      },
      act: (bloc) => bloc.add(LoadMovieWithGenre(id: 28)),
      expect: () => [
        isA<MovieWithGenreLoading>(),
        isA<MovieWithGenreError>(),
      ],
    );
  });
}
