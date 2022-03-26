import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie/bloc/movie_bloc/movie_event.dart';
import 'package:movie/bloc/movie_bloc/movie_state.dart';
import 'package:movie/pages/movies_page/components/list_related_movies.dart';
import 'package:movie/models/genres.dart';
import 'package:sizer/sizer.dart';

import '../../models/movie.dart';
import '../../pages/video_player_page/video_player.dart';
import '../../styles/images.dart';

class OverviewScreen extends StatelessWidget {
  final Movie movie;
  const OverviewScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> genres = [];
    for (var e in movie.genreIds) {
      genres.add(Genres().listOfGenres[e].toString());
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SizedBox(
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.5.h),
                        child: Text(
                          '9.4',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: MediaQuery.of(context)
                              .textScaleFactor
                              .clamp(1, 1),
                        ),
                      ),
                      const Text('Metascore',
                          style: TextStyle(color: Colors.white)),
                      Text(
                        '53 Critic Reviews',
                        style: Theme.of(context).textTheme.headline6,
                        textScaleFactor: MediaQuery.of(context)
                            .textScaleFactor
                            .clamp(0.75, 0.75),
                      )
                    ],
                  ),
                  const SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.star_rate_rounded,
                          color: Colors.redAccent, size: 30),
                      Row(
                        children: const [
                          Text(
                            '8.1',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text('/10', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Text(
                        '189 Reviews',
                        style: Theme.of(context).textTheme.headline6,
                        textScaleFactor: MediaQuery.of(context)
                            .textScaleFactor
                            .clamp(0.8, 0.8),
                      )
                    ],
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.star_border_rounded,
                          size: 30, color: Colors.white70),
                      Text('Rate this', style: TextStyle(color: Colors.white)),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage(
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 100),
                    placeholder: const AssetImage(Images.placeholder),
                    image: NetworkImage(movie.posterPath),
                    fit: BoxFit.cover,
                    width: 35.w,
                    height: 26.h,
                  ),
                ),
                SizedBox(width: 4.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    description(context, 'Title: ', movie.title),
                    description(context, 'Running Time: ', '1:47:58 hd'),
                    description(context, 'Release Date: ', movie.releaseDate),
                    description(context, 'genre: ', genres.join(', ')),
                    description(context, 'Director: ', 'Yusupov S. A.'),
                    description(context, 'Writer: ', 'Christofer Nolan'),
                  ],
                ),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Overview',
                style: Theme.of(context).textTheme.headline5,
                textScaleFactor:
                    MediaQuery.of(context).textScaleFactor.clamp(0.6, 0.6),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              movie.overview,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SizedBox(
              width: double.infinity,
              height: 6.5.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const VideoApp())));
                },
                child: Text(
                  'Play',
                  style: Theme.of(context).textTheme.headline3,
                  textScaleFactor:
                      MediaQuery.of(context).textScaleFactor.clamp(1, 1),
                ),
              ),
            ),
          ),
          divider(),
          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              BlocProvider.of<MovieBloc>(context).add(MovieEventStarted());
              if (state is MovieLoadedState) {
                return ListRelatedMovies(movie: state.nowPlayingMovies);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Padding divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      child: Container(
        color: Colors.white54,
        width: double.infinity,
        height: 0.1,
      ),
    );
  }

  Widget description(BuildContext context, String text, String request) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: SizedBox(
        width: 50.w,
        child: RichText(
          maxLines: 2,
          overflow: TextOverflow.fade,
          textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(1, 1),
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: request,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
