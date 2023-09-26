import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/app_bar/app_bar.dart';
import 'package:idwey/components/filter_item/filter_item.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:idwey/presentation/pages/home/event_tab.dart';
import 'package:idwey/presentation/pages/home/experience_tab.dart';
import 'package:idwey/presentation/pages/home/home_page.dart';

import 'activity_tab.dart';

@RoutePage()
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController hostScrollController = ScrollController();
  late ScrollController eventScrollController = ScrollController();
  late ScrollController activityScrollController = ScrollController();
  late ScrollController experienceScrollController = ScrollController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedIndex = (_tabController.index).round();

        //_tabController.animation.value returns double
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    hostScrollController.dispose();
    eventScrollController.dispose();
    activityScrollController.dispose();
    experienceScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Platform.isIOS
                  ? Size.fromHeight(180.h)
                  : Size.fromHeight(200.h),
              child: AppBar(
                elevation: 1.0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                //title: SearchBox(),
                flexibleSpace: const SearchBox(),
                bottom: TabBar(
                  isScrollable: true,
                  padding:
                      EdgeInsets.only(bottom: 16.h, left: 8.w, right: 12.w),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  // Reduce padding between tabs
                  controller: _tabController,
                  labelColor: Colors.grey,
                  labelPadding: EdgeInsets.only(left: 8.w),
                  indicator: const BoxDecoration(),
                  // Remove the indicator
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    FilterItem(
                      label: 'Hébergement',
                      icon: Assets.hosts,
                      onTap: (v) {
                        /// navigate to screen home
                        setState(() {
                          if (hostScrollController.hasClients) {
                            if (hostScrollController.position.pixels > 0) {
                              hostScrollController.animateTo(0,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut);
                            }
                          }
                          selectedIndex = 0;
                          _tabController.index = 0;
                        });
                      },
                      isSelected: selectedIndex == 0,
                    ),
                    FilterItem(
                      label: 'Evenement',
                      icon: Assets.events,
                      onTap: (v) {
                        setState(() {
                          if (eventScrollController.hasClients) {
                            if (eventScrollController.position.pixels > 0) {
                              eventScrollController.animateTo(0,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut);
                            }
                          }
                          selectedIndex = 1;
                          _tabController.index = 1;
                        });
                      },
                      isSelected: selectedIndex == 1,
                    ),
                    FilterItem(
                      label: 'Acitvités',
                      icon: Assets.activities,
                      onTap: (v) {
                        setState(() {
                          if (activityScrollController.hasClients) {
                            if (activityScrollController.position.pixels > 0) {
                              activityScrollController.animateTo(0,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut);
                            }
                          }
                          selectedIndex = 2;
                          _tabController.index = 2;
                        });
                      },
                      isSelected: selectedIndex == 2,
                    ),
                    FilterItem(
                      label: 'Experiences',
                      icon: Assets.experiences,
                      onTap: (vv) {
                        setState(() {
                          if (experienceScrollController.hasClients) {
                            if (experienceScrollController.position.pixels >
                                0) {
                              experienceScrollController.animateTo(0,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut);
                            }
                          }
                          selectedIndex = 3;
                          _tabController.index = 3;
                        });
                      },
                      isSelected: selectedIndex == 3,
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                HomeScreen(
                  scrollController: hostScrollController,
                ),
                EventScreen(
                  scrollController: eventScrollController,
                ),
                ActivityScreen(
                  scrollController: activityScrollController,
                ),
                ExperienceScreen(
                  scrollController: experienceScrollController,
                ),
              ],
            ));
      },
    );
  }
}
