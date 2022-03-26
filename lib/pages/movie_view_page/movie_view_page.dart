import 'package:flutter/material.dart';
import 'package:movie/models/genres.dart';
import 'package:movie/screens/MovieViewPage_Screens/overview_screen.dart';
import 'package:movie/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../models/movie.dart';

class MovieViewPage extends StatefulWidget {
  final Movie movie;
  const MovieViewPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieViewPage> createState() => _MovieViewPageState();
}

class _MovieViewPageState extends State<MovieViewPage> {
  final _scrollController = ScrollController();
  bool asd = false;
  double kExpandedHeight = (100.h / 100) * 55;

  bool get _bas {
    return _scrollController.hasClients &&
        _scrollController.offset > (kExpandedHeight - (kToolbarHeight * 4));
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() => setState(() {
          asd = _bas;
        }));
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: kExpandedHeight,
                  backgroundColor: AppColors.dBackground,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                    splashRadius: 20,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.playlist_add,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  title: AnimatedCrossFade(
                    firstChild: Text(
                      widget.movie.title,
                      style: Theme.of(context).textTheme.headline2,
                      textScaleFactor: MediaQuery.of(context)
                          .textScaleFactor
                          .clamp(0.5, 0.5),
                    ),
                    secondChild: const SizedBox(),
                    crossFadeState: asd
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 300),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.blurBackground,
                      StretchMode.zoomBackground,
                      StretchMode.fadeTitle
                    ],
                    background: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          widget.movie.backdropPath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              center: Alignment.center,
                              colors: [
                                AppColors.dcanvas.withOpacity(0.1),
                                AppColors.dcanvas.withOpacity(0.2),
                                AppColors.dcanvas.withOpacity(0.5),
                                AppColors.dcanvas.withOpacity(0.6),
                                AppColors.dcanvas.withOpacity(0.9),
                                AppColors.dcanvas,
                              ],
                              radius: 0.7,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              splashColor: Colors.white12,
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.transparent,
                                child: Center(
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    color: AppColors.amber,
                                    size: 80,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.movie.title,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.headline5,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: MediaQuery.of(context)
                                    .textScaleFactor
                                    .clamp(0.7, 0.7),
                              ),
                              SizedBox(height: 1.h),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for (var e in widget.movie.genreIds)
                                      genre(Genres().listOfGenres[e].toString(),
                                          context)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    const TabBar(
                      indicatorColor: AppColors.amber,
                      tabs: [
                        Tab(child: Text('Overview')),
                        Tab(child: Text('Сreators')),
                        Tab(child: Text('Traller')),
                        Tab(child: Text('Reviews')),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                OverviewScreen(movie: widget.movie),
                ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 50,
                      color: Colors.amber,
                    ),
                    title: Text('Place ${index + 1}', textScaleFactor: 2),
                  );
                }),
                ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 50,
                      color: Colors.amber,
                    ),
                    title: Text('Place ${index + 1}', textScaleFactor: 2),
                  );
                }),
                ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 50,
                      color: Colors.amber,
                    ),
                    title: Text('Place ${index + 1}', textScaleFactor: 2),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget genre(String text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.w),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white70, width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.headline6,
          textScaleFactor:
              MediaQuery.of(context).textScaleFactor.clamp(0.8, 0.8),
        ),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.dcanvas,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
