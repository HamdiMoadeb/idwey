import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/buttons/dropdown_buttom.dart';
import 'package:idwey/components/filter_item/filter_item.dart';
import 'package:idwey/components/inputs/date_input.dart';
import 'package:idwey/constants/assets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Platform.isIOS ? Size.fromHeight(140.h) : Size.fromHeight(160.h),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          elevation: 1.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            isScrollable: true,
            padding: EdgeInsets.only(bottom: 16.h, left: 8.w, right: 12.w),
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
                      if (experienceScrollController.position.pixels > 0) {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// 3 buttons when clicked show widgets
            /// 1. Search by location
            /// 2. Search by date
            /// 3. add invitees
            CustomDropDownMenuButton(
              selectedOption: 'Tunis',
            ),
            CustomDateInput(),
          ],
        ),
      ),
    );
  }
}
