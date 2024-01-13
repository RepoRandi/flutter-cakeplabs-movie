import 'package:bloc/bloc.dart';
import 'package:cakeplabs_movie/data/repositories/movie/movie_repository.dart';
import 'package:cakeplabs_movie/domain/entities/genre/genre.dart';
import 'package:meta/meta.dart';

part 'movie_genres_event.dart';
part 'movie_genres_state.dart';

class MovieGenresBloc extends Bloc<MovieGenresEvent, MovieGenresState> {
  final MovieRepository movieRepository;

  MovieGenresBloc({required this.movieRepository})
      : super(MovieGenresInitial()) {
    on<LoadMovieGenres>((event, emit) async {
      emit(MovieGenresLoading());
      try {
        final result = await movieRepository.getMovieGenres();
        if (result.isSuccess) {
          emit(MovieGenresLoaded(genres: result.resultValue!));
        } else {
          emit(MovieGenresError(error: result.errorMessage!));
        }
      } catch (error) {
        emit(MovieGenresError(error: error.toString()));
      }
    });
  }
}
