import 'package:equatable/equatable.dart';
import 'package:movie/models/movie.dart';


class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieLoadingState extends MovieState {
  const MovieLoadingState();
}

class MovieLoadedState extends MovieState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upComingMovies;

  const MovieLoadedState({
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upComingMovies,
  });

  @override
  List<Object?> get props =>
      [nowPlayingMovies, popularMovies, topRatedMovies, upComingMovies];
}

class MovieLoadFailedState extends MovieState {
  final String exception;

  const MovieLoadFailedState(this.exception);
}
