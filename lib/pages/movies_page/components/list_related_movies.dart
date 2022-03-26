import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../models/movie.dart';
import '../../movie_view_page/movie_view_page.dart';
import '../../../styles/colors.dart';
import '../../../styles/images.dart';

class ListRelatedMovies extends StatelessWidget {
  final List<Movie> movie;
  const ListRelatedMovies({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Related Movies',
              style: Theme.of(context).textTheme.headline5,
              textScaleFactor:
                  MediaQuery.of(context).textScaleFactor.clamp(0.6, 0.6),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: 26.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 100),
                        placeholder: const AssetImage(Images.placeholder),
                        image: NetworkImage(movie[i].posterPath),
                        fit: BoxFit.cover,
                        width: 35.w,
                        height: 26.h,
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
                                builder: (context) => MovieViewPage(movie: movie[i]),
                              ),
                            );
                          },
                          splashColor: Colors.white30,
                          highlightColor: Colors.white30,
                          child: SizedBox(
                            width: 35.w,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 35.w,
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
                              EdgeInsets.only(top: 2.h, left: 1.w, right: 1.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              movie[i].title,
                              style: Theme.of(context).textTheme.headline4,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              textScaleFactor: MediaQuery.of(context)
                                  .textScaleFactor
                                  .clamp(1, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
