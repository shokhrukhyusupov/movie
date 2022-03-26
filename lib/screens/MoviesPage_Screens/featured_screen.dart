import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie/bloc/movie_bloc/movie_event.dart';
import 'package:movie/pages/movie_view_page/movie_view_page.dart';
import 'package:movie/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/movie_bloc/movie_state.dart';
import '../../styles/images.dart';

class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        BlocProvider.of<MovieBloc>(context).add(MovieEventStarted());
        if (state is MovieLoadedState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 100),
                        placeholder: const AssetImage(Images.placeholder),
                        image: NetworkImage(state.popularMovies[i].posterPath),
                        fit: BoxFit.cover,
                        width: 48.w,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => MovieViewPage(
                                  movie: state.popularMovies[i],
                                ),
                              ),
                            );
                          },
                          splashColor: Colors.white30,
                          highlightColor: Colors.white30,
                          child: SizedBox(
                            width: 48.w,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 48.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      AppColors.dBackground.withOpacity(0.2),
                                      AppColors.dBackground.withOpacity(0.4),
                                      AppColors.dBackground.withOpacity(0.6),
                                      AppColors.dBackground.withOpacity(0.8),
                                      AppColors.dBackground,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(2.w, 0, 2.w, 1.h),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      state.popularMovies[i].title,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor
                                          .clamp(0.45, 0.45),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Center(
              child: Text(
            'Failed',
            style: TextStyle(color: Colors.white, fontSize: 50),
          ));
        }
      },
    );
  }
}
