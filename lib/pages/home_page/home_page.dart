import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie/bloc/movie_bloc/movie_event.dart';
import 'package:movie/bloc/movie_bloc/movie_state.dart';
import 'package:sizer/sizer.dart';

import 'components/homepage_slider.dart';
import 'components/list_movies.dart';
import 'components/list_trailers.dart';
import 'components/list_tv.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        BlocProvider.of<MovieBloc>(context).add(MovieEventStarted());
        if (state is MovieLoadedState) {
          final nowPlayingMoviesList = state.nowPlayingMovies;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      for (var i = 0; i <= 10; i++)
                        HomePageSlider(movie: nowPlayingMoviesList[i])
                    ],
                    options: CarouselOptions(
                      height: 30.h,
                      aspectRatio: 1 / 1,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 10),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  ListTv(tv: state.topRatedMovies),
                  ListTrailers(trailer: state.topRatedMovies),
                  ListMovies(
                    title: 'Popular Movies',
                    movie: state.popularMovies,
                  ),
                  ListMovies(
                    title: 'Now in the cinema',
                    movie: state.upComingMovies,
                  ),
                ],
              ),
            ),
          );
        } else if (state is MovieLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieLoadFailedState) {
          return Center(
            child: Text(
              state.exception,
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else {
          return const Center(
            child: Text(
              '?????',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
      },
    );
  }
}
