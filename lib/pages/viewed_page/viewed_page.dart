import 'package:flutter/material.dart';
import 'package:movie/widgets/tab_widget.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class ViewedPage extends StatelessWidget {
  const ViewedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(8.h),
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
                TabWidget(label: 'Favourites'),
                TabWidget(label: 'Downloads'),
                TabWidget(label: 'History'),
                TabWidget(label: 'In the rental'),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Favourites')),
            Center(child: Text('Downloads')),
            Center(child: Text('History')),
            Center(child: Text('In the rental')),
          ],
        ),
      ),
    );
  }
}
