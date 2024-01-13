import 'package:bloc/bloc.dart';
import 'package:cakeplabs_movie/data/repositories/movie/movie_repository.dart';
import 'package:cakeplabs_movie/domain/entities/movie/movie.dart';
import 'package:meta/meta.dart';

part 'movie_now_playing_event.dart';
part 'movie_now_playing_state.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final MovieRepository movieRepository;

  MovieNowPlayingBloc({required this.movieRepository})
      : super(MovieNowPlayingInitial()) {
    on<LoadMovieNowPlaying>((event, emit) async {
      emit(MovieNowPlayingLoading());
      try {
        final result = await movieRepository.getMovieNowPlaying();
        if (result.isSuccess) {
          emit(MovieNowPlayingLoaded(movies: result.resultValue!));
        } else {
          emit(MovieNowPlayingError(error: result.errorMessage!));
        }
      } catch (error) {
        emit(MovieNowPlayingError(error: error.toString()));
      }
    });
  }
}
