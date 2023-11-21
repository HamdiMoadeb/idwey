import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/pages/filter_screen/sections/commodities_section.dart';
import 'package:idwey/presentation/pages/filter_screen/sections/host_service_section.dart';
import 'package:idwey/presentation/pages/filter_screen/sections/property_section.dart';
import 'package:idwey/theme/app_colors.dart';

import '../../../app_router/app_router.dart';
import 'sections/range_slider_section.dart';

@RoutePage()
class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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
                  const RangeSliderSection(),
                  const Divider(
                    thickness: 1,
                  ),
                  state.selectedTab == 0
                      ? const PropertySection()
                      : const SizedBox.shrink(),
                  state.selectedTab == 1
                      ? CommoditiesFilterSection(
                          title: "Type de l'événement",
                          extraPrices: ["Camping ", "Équitation", "Escalade"])
                      : const SizedBox.shrink(),
                  state.selectedTab == 3
                      ? CommoditiesFilterSection(
                          title: "Type de l'expérience",
                          extraPrices: [
                              "Aventure sportive ",
                              "Découverte culturelle",
                              "Escalade"
                            ])
                      : const SizedBox.shrink(),
                  state.selectedTab == 2
                      ? CommoditiesFilterSection(
                          title: "Type de l'activité",
                          extraPrices: [
                              "Équitation",
                              "Action écologique",
                              "Randonnées"
                            ])
                      : const SizedBox.shrink(),
                  state.selectedTab == 2
                      ? CommoditiesFilterSection(
                          title: "Style",
                          extraPrices: ["Culturel", "Nature", "Culinaire"])
                      : const SizedBox.shrink(),
                  CommoditiesFilterSection(title: "Commodités", extraPrices: [
                    "Wifi",
                    "Climatisation",
                    "Guide",
                    "Dîner Accessible aux personnes à mobilité réduite"
                  ]),
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
}
