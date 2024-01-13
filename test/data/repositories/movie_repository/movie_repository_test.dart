import 'package:cakeplabs_movie/data/repositories/movie/movie_repository.dart';
import 'package:cakeplabs_movie/data/tmdb/tmdb_movie_repository.dart';
import 'package:cakeplabs_movie/domain/entities/genre/genre.dart';
import 'package:cakeplabs_movie/domain/entities/movie/movie.dart';
import 'package:cakeplabs_movie/domain/entities/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieRepository Tests', () {
    late MovieRepository movieRepository;

    setUp(() {
      movieRepository = TmdbMovieRepository();
    });

    test('getMovieNowPlaying returns a list of movies', () async {
      final Result<List<Movie>> result =
          await movieRepository.getMovieNowPlaying();
      expect(result.isSuccess, true);
      expect(result.resultValue, isA<List<Movie>>());
    });

    test('getMovieGenres returns a list of genres', () async {
      final Result<List<Genre>> result = await movieRepository.getMovieGenres();
      expect(result.isSuccess, true);
      expect(result.resultValue, isA<List<Genre>>());
    });

    test('getMovieWithGenre returns a list of movies for a given genre id',
        () async {
      const int genreId = 28;
      final Result<List<Movie>> result =
          await movieRepository.getMovieWithGenre(id: genreId);
      expect(result.isSuccess, true);
      expect(result.resultValue, isA<List<Movie>>());
    });
  });
}
