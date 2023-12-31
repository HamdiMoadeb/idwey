import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/components/inputs/date_input.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/pages/details_page/components/product_page_header/product_page_header.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:intl/intl.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  final int selectedTab;
  const SearchScreen({Key? key, required this.selectedTab}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int selectedIndex = 0;
  int guests = 1;
  bool? showDatePicker = false;
  bool? showAddInvites = false;
  final List<String> emplacementList = [
    "Plage",
    "Foret",
    "Sahara",
    "Ville",
    "Montagne",
    "Campagne"
  ];
  final List<String> items = [
    "Tunis",
    "Sousse",
    "Monastir",
    "Sfax",
    "Nabeul",
    "Bizerte",
    "Gabes",
    "Kairouan",
    "Gafsa",
    "Ariana",
    "Kasserine",
    "Ben Arous",
    "Medenine",
    "Tataouine",
    "Manouba",
    "Mahdia",
    "Jendouba",
    "Sidi Bouzid",
    "Siliana",
    "Le Kef",
    "Kebili",
    "Tozeur",
    "Beja",
    "Zaghouan",
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = context.read<HomeBloc>().state.selectedTab ?? 0;
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
            preferredSize: Platform.isIOS
                ? Size.fromHeight(140.h)
                : Size.fromHeight(160.h),
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
                  FilterItemWidget(
                    label: 'Hébergement',
                    icon: Assets.hosts,
                    onTap: (v) {
                      /// navigate to screen home
                      setState(() {
                        selectedIndex = 0;
                        _tabController.index = 0;
                        context
                            .read<HomeBloc>()
                            .add(const HomeEvent.setSelectedTab(0));
                      });
                    },
                    isSelected: selectedIndex == 0,
                  ),
                  FilterItemWidget(
                    label: 'Evenement',
                    icon: Assets.events,
                    onTap: (v) {
                      setState(() {
                        selectedIndex = 1;
                        _tabController.index = 1;
                        context
                            .read<HomeBloc>()
                            .add(const HomeEvent.setSelectedTab(1));
                      });
                    },
                    isSelected: selectedIndex == 1,
                  ),
                  FilterItemWidget(
                    label: 'Acitvités',
                    icon: Assets.activities,
                    onTap: (v) {
                      setState(() {
                        selectedIndex = 2;
                        _tabController.index = 2;
                        context
                            .read<HomeBloc>()
                            .add(const HomeEvent.setSelectedTab(2));
                      });
                    },
                    isSelected: selectedIndex == 2,
                  ),
                  FilterItemWidget(
                    label: 'Experiences',
                    icon: Assets.experiences,
                    onTap: (vv) {
                      setState(() {
                        selectedIndex = 3;
                        _tabController.index = 3;
                        context
                            .read<HomeBloc>()
                            .add(const HomeEvent.setSelectedTab(3));
                      });
                    },
                    isSelected: selectedIndex == 3,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.router.popUntilRoot();
                        if (state.selectedTab == 0) {
                          context
                              .read<HomeBloc>()
                              .add(const HomeEvent.getListHosts(false));
                        } else if (state.selectedTab == 1) {
                          context
                              .read<HomeBloc>()
                              .add(const HomeEvent.getListEvents(false));
                        } else if (state.selectedTab == 2) {
                          context
                              .read<HomeBloc>()
                              .add(const HomeEvent.getListActivities(false));
                        } else if (state.selectedTab == 3) {
                          context
                              .read<HomeBloc>()
                              .add(const HomeEvent.getListExperiences(false));
                        }
                      },
                      child: Text(
                        "Effacer tout",
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16.sp,
                                  color: primary,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  //commented for deployment
                  CustomButton.primary(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            Assets.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const Text("Rechercher"),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      if (state.selectedTab == 0) {
                        context
                            .read<HomeBloc>()
                            .add(const HomeEvent.getSearchListHosts(false));
                      } else if (state.selectedTab == 1) {
                        context
                            .read<HomeBloc>()
                            .add(const HomeEvent.getSearchListEvents(false));
                      } else if (state.selectedTab == 2) {
                        context.read<HomeBloc>().add(
                            const HomeEvent.getSearchListActivities(false));
                      } else if (state.selectedTab == 3) {
                        context.read<HomeBloc>().add(
                            const HomeEvent.getSearchListExperiences(false));
                      }
                      context.router.popUntilRoot();
                    },
                  )
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// 3 buttons when clicked show widgets
                  /// 1. Search by location
                  /// 2. Search by date
                  /// 3. add invitees
                  CustomDropDownMenuButton(
                    items: items,
                    showDropDown: state.city == "" ? true : false,
                    selectedOption: state.city ?? "Tunis",
                    onChanged: (v) {
                      context.read<HomeBloc>().add(HomeEvent.changeCity(v));
                    },
                  ),
                  Visibility(
                    visible: state.selectedTab == 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        EmplacementDropDownMenuButton(
                          items: state.emplacementList ?? emplacementList,
                          showDropDown: state.emplacement == "" ? true : false,
                          selectedOption: state.emplacement ?? "",
                          onChanged: (v) {
                            context
                                .read<HomeBloc>()
                                .add(HomeEvent.changeEmplacement(v));
                          },
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showDatePicker == false,
                    child: Container(
                      margin: EdgeInsets.only(top: 16.h),
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showDatePicker = !showDatePicker!;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.search,
                                height: 24.h,
                                width: 24.w,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('Sélectionner une date',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey.shade500,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: showDatePicker == true,
                      child: CustomDateInput(
                        onDateRangeChanged: (v) {
                          context.read<HomeBloc>().add(
                              HomeEvent.changeStartDate(DateFormat('yyyy-MM-dd')
                                  .format(v.value!.startDate!)));
                          context.read<HomeBloc>().add(HomeEvent.changeEndDate(
                              DateFormat('yyyy-MM-dd')
                                  .format(v.value!.endDate!)));
                        },
                      )),
                  Visibility(
                    visible: showAddInvites == false && selectedIndex != 1,
                    child: Container(
                      height: 60,
                      margin: EdgeInsets.only(top: 16.h),
                      decoration: BoxDecoration(
                        border: state.guests! > 1
                            ? Border.all(color: Colors.black)
                            : Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showAddInvites = !showAddInvites!;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              const HeroIcon(
                                HeroIcons.user,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              state.guests! > 1
                                  ? RichText(
                                      text: TextSpan(
                                        text: "Vous avez : ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.sp,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '${state.guests} invités',
                                            style: TextStyle(
                                              color: primary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Text('Ajouter vos invités',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.grey.shade500,
                                      )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showAddInvites = !showAddInvites!;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 8.h),
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, bottom: 16.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
                              child: Text(
                                'Ajouter vos invités',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                ),
                              ),
                            ),
                            CustomHeader(
                              index: state.guests ?? 1,
                              title: 'Adulte',
                              subtitle: "13 and ou plus ",
                              onchange: (i) {
                                setState(() {
                                  guests = i;
                                });
                                context
                                    .read<HomeBloc>()
                                    .add(HomeEvent.changeGuests(i));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    visible: showAddInvites == true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
