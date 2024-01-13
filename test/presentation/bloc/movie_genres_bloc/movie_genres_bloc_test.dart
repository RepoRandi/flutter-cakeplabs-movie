import 'package:bloc_test/bloc_test.dart';
import 'package:cakeplabs_movie/data/repositories/movie/movie_repository.dart';
import 'package:cakeplabs_movie/domain/entities/genre/genre.dart';
import 'package:cakeplabs_movie/domain/entities/result/result.dart';
import 'package:cakeplabs_movie/presentation/bloc/movie_genres/movie_genres_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  group('MovieGenresBloc', () {
    late MockMovieRepository mockMovieRepository;
    late MovieGenresBloc movieGenresBloc;

    setUp(() {
      mockMovieRepository = MockMovieRepository();
      movieGenresBloc = MovieGenresBloc(movieRepository: mockMovieRepository);
    });

    tearDown(() {
      movieGenresBloc.close();
    });

    blocTest<MovieGenresBloc, MovieGenresState>(
      'emits [MovieGenresLoading, MovieGenresLoaded] when LoadMovieGenres is added and successful',
      build: () {
        when(() => mockMovieRepository.getMovieGenres())
            .thenAnswer((_) async => const Result.success(<Genre>[]));
        return movieGenresBloc;
      },
      act: (bloc) => bloc.add(LoadMovieGenres()),
      expect: () => [
        isA<MovieGenresLoading>(),
        isA<MovieGenresLoaded>(),
      ],
    );

    blocTest<MovieGenresBloc, MovieGenresState>(
      'emits [MovieGenresLoading, MovieGenresError] when LoadMovieGenres fails',
      build: () {
        when(() => mockMovieRepository.getMovieGenres()).thenAnswer(
            (_) async => const Result.failed('Failed to load genres'));
        return movieGenresBloc;
      },
      act: (bloc) => bloc.add(LoadMovieGenres()),
      expect: () => [
        isA<MovieGenresLoading>(),
        isA<MovieGenresError>(),
      ],
    );
  });
}
