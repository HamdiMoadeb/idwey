import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(180),
              child: AppBar(
                elevation: 1.0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                //title: SearchBox(),
                flexibleSpace: const SearchBox(),
                bottom: TabBar(
                  isScrollable: true,
                  padding: const EdgeInsets.only(bottom: 10, left: 4),
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
                  // Reduce padding between tabs
                  controller: _tabController,
                  labelColor: Colors.grey,
                  labelPadding: const EdgeInsets.only(left: 8),
                  indicator: const BoxDecoration(),
                  // Remove the indicator
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    FilterItem(
                      label: 'Hébergement',
                      icon: Assets.hosts,
                      onTap: (bool) {
                        setState(() {
                          selectedIndex = 0;
                          _tabController.index = 0;
                        });
                      },
                      isSelected: selectedIndex == 0,
                    ),
                    FilterItem(
                      label: 'Evenement',
                      icon: Assets.events,
                      onTap: (bool) {
                        setState(() {
                          selectedIndex = 1;
                          _tabController.index = 1;
                        });
                      },
                      isSelected: selectedIndex == 1,
                    ),
                    FilterItem(
                      label: 'Acitvités',
                      icon: Assets.activities,
                      onTap: (bool) {
                        setState(() {
                          selectedIndex = 2;
                          _tabController.index = 2;
                        });
                      },
                      isSelected: selectedIndex == 2,
                    ),
                    FilterItem(
                      label: 'Experiences',
                      icon: Assets.experiences,
                      onTap: (bool) {
                        setState(() {
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
                HomeScreen(),
                EventScreen(),
                ActivityScreen(),
                ExperienceScreen(),
              ],
            ));
      },
    );
  }
}
