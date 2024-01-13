import 'package:bloc/bloc.dart';
import 'package:cakeplabs_movie/data/repositories/movie/movie_repository.dart';
import 'package:cakeplabs_movie/domain/entities/movie/movie.dart';
import 'package:meta/meta.dart';

part 'movie_with_genre_event.dart';
part 'movie_with_genre_state.dart';

class MovieWithGenreBloc
    extends Bloc<MovieWithGenreEvent, MovieWithGenreState> {
  final MovieRepository movieRepository;

  MovieWithGenreBloc({required this.movieRepository})
      : super(MovieWithGenreInitial()) {
    on<LoadMovieWithGenre>((event, emit) async {
      emit(MovieWithGenreLoading());
      try {
        final result = await movieRepository.getMovieWithGenre(id: event.id);
        if (result.isSuccess) {
          emit(MovieWithGenreLoaded(movies: result.resultValue!));
        } else {
          emit(MovieWithGenreError(error: result.errorMessage!));
        }
      } catch (error) {
        emit(MovieWithGenreError(error: error.toString()));
      }
    });
  }
}
