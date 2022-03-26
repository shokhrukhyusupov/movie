import 'package:flutter/material.dart';
import 'package:movie/screens/MoviesPage_Screens/featured_screen.dart';
import 'package:movie/widgets/tab_widget.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.8.h),
          child: AppBar(
            backgroundColor: AppColors.dcanvas,
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: AppColors.amber,
              indicatorWeight: 0.8.w,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 2.w),
              labelStyle: Theme.of(context).textTheme.headline5,
              labelPadding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.height > 500 ? 2.5.h : 5.5.h,
                vertical: 2.h,
              ),
              tabs: const [
                TabWidget(label: 'Featured'),
                TabWidget(label: 'Series'),
                TabWidget(label: 'Films'),
                TabWidget(label: 'Origin'),
                TabWidget(label: 'Featured'),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            FeaturedScreen(),
            Center(child: Text('asd')),
            Center(child: Text('asd')),
            Center(child: Text('asd')),
            Center(child: Text('asd')),
          ],
        ),
      ),
    );
  }
}
