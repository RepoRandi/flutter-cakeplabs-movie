import 'package:dio/dio.dart';

import 'package:cakeplabs_movie/data/repositories/movie/movie_repository.dart';
import 'package:cakeplabs_movie/domain/entities/genre/genre.dart';
import 'package:cakeplabs_movie/domain/entities/movie/movie.dart';
import 'package:cakeplabs_movie/domain/entities/result/result.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String accesToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMTMxN2U0ZDEwMTRmNDM1OGY0MmZiMDgzNzBhZTk5MiIsInN1YiI6IjYyN2NlYzhjNWFhZGM0MTM2NDYzYjQzMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gG9xmt-SqzFsx136vAq7Ld1P1fXrqcemn6sAH8LlK8o';

  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $accesToken',
    'accept': 'application/json'
  });

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Movie>>> getMovieNowPlaying({int page = 1}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=$page',
          options: _options);

      final result = List<Map<String, dynamic>>.from(response.data['results']);

      return Result.success(result.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Genre>>> getMovieGenres() async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/genre/movie/list?language=en',
          options: _options);

      final result = List<Map<String, dynamic>>.from(response.data['genres']);

      return Result.success(result.map((e) => Genre.fromJson(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getMovieWithGenre({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/discover/movie?with_genres=$id',
          options: _options);

      final result = List<Map<String, dynamic>>.from(response.data['results']);

      return Result.success(result.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }
}
