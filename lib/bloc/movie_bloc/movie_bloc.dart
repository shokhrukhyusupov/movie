import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movie_bloc/movie_event.dart';
import 'package:movie/bloc/movie_bloc/movie_state.dart';
import 'package:movie/repositories/movie_repository.dart';


class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;
  MovieBloc(this.movieRepository)
      : super(const MovieLoadingState()) {
    on<MovieEventStarted>((event, emit) async {
      try {
        final nowPlayingMovies =
          await movieRepository.getMovies(1, '/movie/now_playing');
      final popularMovies =
          await movieRepository.getMovies(1, '/movie/popular');
      final topRatedMovies =
          await movieRepository.getMovies(1, '/movie/top_rated');
      final upComingMovies =
          await movieRepository.getMovies(1, '/movie/upcoming');
      emit(MovieLoadedState(
        nowPlayingMovies: nowPlayingMovies,
        popularMovies: popularMovies,
        topRatedMovies: topRatedMovies,
        upComingMovies: upComingMovies,
      ));
      } catch (e) {
        emit(MovieLoadFailedState(e.toString()));
      }
    });
  }
}
