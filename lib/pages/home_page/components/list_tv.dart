import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../models/movie.dart';
import '../../../styles/images.dart';

class ListTv extends StatelessWidget {
  final List<Movie> tv;
  const ListTv({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: Text(
            'Online TV',
            style: Theme.of(context).textTheme.headline5,
            textScaleFactor:
                MediaQuery.of(context).textScaleFactor.clamp(0.6, 0.6),
          ),
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 25.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: FadeInImage(
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 100),
                        placeholder: const AssetImage(Images.placeholder),
                        image: NetworkImage(tv[i].posterPath),
                        fit: BoxFit.cover,
                        width: 35.w,
                        height: 19.h,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 35.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              tv[i].title,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.white30,
                          highlightColor: Colors.white30,
                          child: SizedBox(
                            width: 35.w,
                            height: double.infinity,
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
