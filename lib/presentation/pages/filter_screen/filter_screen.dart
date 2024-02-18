import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/data/models/activity_category.dart';
import 'package:idwey/data/models/attributz.dart';
import 'package:idwey/domain/entities/filter_item.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/pages/filter_screen/sections/commodities_section.dart';
import 'package:idwey/presentation/pages/filter_screen/sections/host_service_section.dart';
import 'package:idwey/presentation/pages/filter_screen/sections/property_section.dart';
import 'package:idwey/theme/app_colors.dart';

import 'sections/range_slider_section.dart';

@RoutePage()
class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<FilterItem> commodities = [];
  List<FilterItem> properties = [];
  List<FilterItem> eventsType = [];
  List<FilterItem> hostServices = [];
  List<FilterItem> activities = [];
  List<FilterItem> style = [];

  @override
  void initState() {
    // TODO: implement initState
    getListAttributes(context.read<HomeBloc>().state.listAttributes ?? []);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  "Filter",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              centerTitle: true,
              bottom: const PreferredSize(
                  child: Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  preferredSize: Size.fromHeight(16.0)),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (state.selectedTab == 0) {
                            context
                                .read<HomeBloc>()
                                .add(const HomeEvent.initFilter());

                            context
                                .read<HomeBloc>()
                                .add(const HomeEvent.getListHosts(false));
                          } else if (state.selectedTab == 1) {
                            context
                                .read<HomeBloc>()
                                .add(const HomeEvent.initFilter());

                            context
                                .read<HomeBloc>()
                                .add(const HomeEvent.getListEvents(false));
                          } else if (state.selectedTab == 2) {
                            context
                                .read<HomeBloc>()
                                .add(const HomeEvent.initFilter());

                            context
                                .read<HomeBloc>()
                                .add(const HomeEvent.getListActivities(false));
                          } else if (state.selectedTab == 3) {
                            context
                                .read<HomeBloc>()
                                .add(const HomeEvent.initFilter());

                            context
                                .read<HomeBloc>()
                                .add(const HomeEvent.getListExperiences(false));
                          }
                          context.router.popUntilRoot();
                        },
                        child: Text(
                          "Effacer tout",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text("Apply Filter"),
                      ),
                      onPressed: () async {
                        print("state.selectedTab");
                        print(state.selectedTab);

                        if (state.selectedTab == 0) {
                          context.read<HomeBloc>().add(
                              const HomeEvent.getFilterListHostsPageData(
                                  false));
                        } else if (state.selectedTab == 1) {
                          context.read<HomeBloc>().add(
                              const HomeEvent.getFilterListEventsPageData(
                                  false));
                        } else if (state.selectedTab == 2) {
                          context.read<HomeBloc>().add(
                              const HomeEvent.getFilterListActivitiesPageData(
                                  false));
                        } else if (state.selectedTab == 3) {
                          context.read<HomeBloc>().add(
                              const HomeEvent.getFilterListExperiencesPageData(
                                  false));
                        }
                        context.router.popUntilRoot();
                      },
                    )
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  RangeSliderSection(
                    values: [
                      double.tryParse(
                              state.selectedPriceRanges?[0] ?? "0.00") ??
                          0,
                      double.tryParse(
                              state.selectedPriceRanges?[1] ?? "0.00") ??
                          1000
                    ],
                    min:
                        double.tryParse(state.minPriceRange ?? "0.00")!.toInt(),
                    max: double.tryParse(state.maxPriceRange ?? "1000.00")!
                        .toInt(),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  state.selectedTab == 0
                      ? const PropertySection()
                      : const SizedBox.shrink(),
                  state.selectedTab == 1
                      ? CommoditiesFilterSection(
                          selectedIds: state.selectedAttributesId ?? [],
                          title: "Type de l'événement",
                          extraPrices: eventsType)
                      : const SizedBox.shrink(),
                  state.selectedTab == 3
                      ? CommoditiesFilterSection(
                          selectedIds: state.selectedAttributesId ?? [],
                          title: "Type de l'expérience",
                          extraPrices: getActivityCategories(
                              state.listActivityCategories ?? []))
                      : const SizedBox.shrink(),
                  state.selectedTab == 2
                      ? CommoditiesFilterSection(
                          selectedIds: state.selectedAttributesId ?? [],
                          title: "Type de l'activité",
                          extraPrices: getActivityCategories(
                              state.listActivityCategories ?? []))
                      : const SizedBox.shrink(),
                  state.selectedTab == 2
                      ? CommoditiesFilterSection(
                          selectedIds: state.selectedAttributesId ?? [],
                          title: "Style",
                          extraPrices: style)
                      : const SizedBox.shrink(),
                  CommoditiesFilterSection(
                      selectedIds: state.selectedAttributesId ?? [],
                      title: "Commodités",
                      extraPrices: commodities),
                  state.selectedTab == 0
                      ? const HostServiceSection()
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  getListAttributes(List<AttributeDto> list) {
    for (var element in list) {
      if (element.name == "Type de propriété") {
        element.terms?.forEach((x) {
          properties.add(FilterItem(name: x.name ?? "", id: x.id ?? 0));
        });
      } else if (element.name == "Commodités") {
        element.terms?.forEach((x) {
          commodities.add(FilterItem(name: x.name ?? "", id: x.id ?? 0));
        });
      } else if (element.name == "Host Service") {
        element.terms?.forEach((x) {
          hostServices.add(FilterItem(name: x.name ?? "", id: x.id ?? 0));
        });
      } else if (element.name == "Type de l'événement") {
        element.terms?.forEach((x) {
          eventsType.add(FilterItem(name: x.name ?? "", id: x.id ?? 0));
        });
      } else if (element.name == "Style") {
        element.terms?.forEach((x) {
          style.add(FilterItem(name: x.name ?? "", id: x.id ?? 0));
        });
      }
    }
  }

  getActivityCategories(List<ActivityCategory> list) {
    for (var element in list) {
      activities.add(FilterItem(name: element.name ?? "", id: element.id ?? 0));
    }
    return activities;
  }
}
