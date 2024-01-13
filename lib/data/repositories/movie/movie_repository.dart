import 'package:cakeplabs_movie/domain/entities/genre/genre.dart';
import 'package:cakeplabs_movie/domain/entities/movie/movie.dart';
import 'package:cakeplabs_movie/domain/entities/result/result.dart';

abstract interface class MovieRepository {
  Future<Result<List<Movie>>> getMovieNowPlaying({int page = 1});
  Future<Result<List<Genre>>> getMovieGenres();
  Future<Result<List<Movie>>> getMovieWithGenre({required int id});
}
