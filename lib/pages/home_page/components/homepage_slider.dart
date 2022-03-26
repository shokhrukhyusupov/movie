import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../models/movie.dart';
import '../../../styles/images.dart';

class HomePageSlider extends StatelessWidget {
  final Movie movie;
  const HomePageSlider({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage(
          fadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 100),
          placeholder: const AssetImage(Images.placeholder),
          image: NetworkImage(movie.backdropPath),
          fit: BoxFit.cover,
          height: 30.h,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 14.2.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black12,
                  Colors.black26,
                  Colors.black54,
                  Colors.black87
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline5,
                    textScaleFactor: MediaQuery.of(context)
                        .textScaleFactor
                        .clamp(0.6, 0.6),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 1,
                        height: 9.h,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.releaseDate,
                              style: Theme.of(context).textTheme.headline5,
                              textScaleFactor: MediaQuery.of(context)
                                  .textScaleFactor
                                  .clamp(0.5, 0.5),
                            ),
                            SizedBox(height: 0.5.h),
                            SizedBox(
                              width: 93.w,
                              child: Text(
                                movie.overview,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.headline5,
                                textScaleFactor: MediaQuery.of(context)
                                    .textScaleFactor
                                    .clamp(0.4, 0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.white30,
            highlightColor: Colors.white30,
            child: SizedBox(
              height: 30.h,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
