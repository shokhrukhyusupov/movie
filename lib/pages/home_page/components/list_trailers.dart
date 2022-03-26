import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../models/movie.dart';
import '../../movie_view_page/movie_view_page.dart';

class ListTrailers extends StatelessWidget {
  final List<Movie> trailer;
  const ListTrailers({Key? key, required this.trailer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: Text(
            'New trailers',
            style: Theme.of(context).textTheme.headline5,
            textScaleFactor:
                MediaQuery.of(context).textScaleFactor.clamp(0.6, 0.6),
          ),
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 16.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return Stack(
                children: [
                  SizedBox(
                    width: 19.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.amber,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: AppColors.dBackground,
                            child: CircleAvatar(
                              radius: 26,
                              backgroundImage:
                                  NetworkImage(trailer[i].backdropPath),
                              backgroundColor: AppColors.dBackground,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Text(
                            trailer[i].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline5,
                            textScaleFactor: MediaQuery.of(context)
                                .textScaleFactor
                                .clamp(0.4, 0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                MovieViewPage(movie: trailer[i]),
                          ),
                        );
                      },
                      splashColor: Colors.white30,
                      highlightColor: Colors.white30,
                      child: SizedBox(
                        height: 18.h,
                        width: 19.w,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
