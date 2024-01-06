import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/bottom_bar.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/components/read_more_text.dart';
import 'package:idwey/components/verify_disponibility_bottom_sheet_content/bottom_sheet.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/presentation/blocs/details_host_bloc/details_page_bloc.dart';
import 'package:idwey/presentation/pages/details_page/components/commodite_section/commodite_section.dart';
import 'package:idwey/presentation/pages/details_page/components/extra_price_section/extra_price_section.dart';
import 'package:idwey/presentation/pages/details_page/components/map_section/map_section.dart';
import 'package:idwey/presentation/pages/details_page/components/reviews_section/reviews_section.dart';
import 'package:idwey/presentation/pages/details_page/components/terms_section/terms_section.dart';
import 'package:idwey/presentation/pages/details_page/components/type_capacite_section/type_capacite_section.dart';
import 'package:idwey/theme/app_colors.dart';

import 'components/chalets_section/chalets_section.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  final int? id;
  final String? typeHost;
  const DetailsScreen({Key? key, required this.id, required this.typeHost})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  bool showAppBar = false;
  bool isChecked = false;

  @override
  void initState() {
    print("widget.typeHost");
    print(widget.typeHost);
    BlocProvider.of<DetailsPageBloc>(context)
        .add(DetailsPageEvent.getHostDetails(widget.id ?? 0));

    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return BlocBuilder<DetailsPageBloc, DetailsPageState>(
            builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return const Center(
              child: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          } else if (state.status == StateStatus.error &&
              state.hostDetails == null) {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          } else if (state.status == StateStatus.success &&
              state.hostDetails != null) {
            return Scaffold(
              bottomNavigationBar: BottomAppBar(
                elevation: 0,
                child: BottomReservationBar(
                  onPressed: () {
                    appState.isLoggedIn == true
                        ? GetIt.I<AppRouter>().push(
                            VerifyDisponibilityRoute(
                              subtitle: "13 ans ou plus",
                              url: state.hostDetails?.bannerImageUrl ?? "",
                              typeReservation: TypeReservation.host,
                              typeHost: widget.typeHost,
                              salePrice: state.hostDetails?.row?.salePrice
                                      .toString() ??
                                  "",
                              price: state.hostDetails?.row?.price ?? "",
                              perPerson:
                                  state.hostDetails?.row?.perPerson ?? "",
                              id: state.hostDetails?.row?.id.toString() ?? "",
                              title: state.hostDetails?.row?.title ?? "",
                              address: state.hostDetails?.row?.address ?? "",
                              minNuits: state.hostDetails?.row?.minNuits ?? 0,
                              extraPrice: state.extraPrice ?? [],
                              //rooms: state.hostDetails?.rooms ?? [],
                            ),
                          )
                        : showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  child: const DraggableBottomSheet());
                            },
                          );
                  },
                  nbNuit: state.hostDetails?.row?.minNuits ?? 0,
                  perPerson: "nuit",
                  salePrice: double.parse(
                          state.hostDetails?.row?.salePrice?.toString() ?? "0")
                      .toInt()
                      .toString(),
                  price: double.parse(state.hostDetails?.row?.price ?? "0")
                      .toInt()
                      .toString(),
                ),
              ),
              body: Stack(
                children: [
                  CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      CustomSliverAppBar(
                        bannerWidget: ImageBanner(
                            listImages:
                                state.hostDetails?.galleryImagesUrl ?? []),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.w, right: 16.w, bottom: 40.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.hostDetails?.row?.title ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        state.hostDetails?.row?.promotion !=
                                            null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: CircleAvatar(
                                        radius: 24.r,
                                        child: Text(
                                          "${state.hostDetails?.row?.promotion} %",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  HeroIcon(
                                    HeroIcons.mapPin,
                                    color: primary,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    state.hostDetails?.row?.address ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: primary),
                                  ),
                                ],
                              ),
                              ExpandableDescription(
                                description:
                                    state.hostDetails?.row?.content ?? "",
                                readMoreLabel: "Lire la suite",
                                readLessLabel: "Lire moins",
                                maxLines: 2,
                                isExpandable: true,
                                bodyColor: Colors.grey[500],
                                buttonColor: primary,
                              ),
                              // trimMode: TrimMode.li
                              const Divider(
                                thickness: 1,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 10.h),
                                child: Text(
                                  'Type • Capacite • Emplacment',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                              ),
                              TypeCapaciteSection(
                                typeReservation: TypeReservation.host,
                                type: state.hostDetails?.attributes?["5"]
                                        ?.child?[0] ??
                                    "",
                                capacite:
                                    state.hostDetails?.row?.maxPerson ?? "",
                                emplacement: state.hostDetails?.attributes?["6"]
                                        ?.child?[0] ??
                                    "",
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              state.hostDetails?.row?.extraPrice != null &&
                                      state.hostDetails!.row?.extraPrice
                                              ?.isNotEmpty ==
                                          true
                                  ? ExtraPriceSection(
                                      extraPrices:
                                          state.hostDetails!.row?.extraPrice ??
                                              [],
                                    )
                                  : const SizedBox.shrink(),

                              state.hostDetails!.rooms!.isNotEmpty
                                  ? ChaletsSection(state: state)
                                  : const SizedBox.shrink(),

                              CommoditiesSection(
                                typeReservation: TypeReservation.host,
                                listCommodities: state
                                        .hostDetails?.attributes!['6']?.child ??
                                    [],
                              ),

                              MapSection(
                                title: state.hostDetails?.row?.title ?? "",
                                lat: state.hostDetails?.row?.mapLat ?? "",
                                lng: state.hostDetails?.row?.mapLng ?? "",
                              ),
                              const Divider(),
                              ReviewsSection(
                                id: state.hostDetails?.row?.id.toString() ?? "",
                                type: "host",
                                canReview: state.hostDetails?.canreview == 0
                                    ? false
                                    : true,
                                reviews: state.hostDetails?.reviewList ?? [],
                                averageRating:
                                    state.hostDetails?.moyRate.toString() ??
                                        "0",
                                reviewsNumber: state
                                        .hostDetails?.reviewList?.length
                                        .toString() ??
                                    "0",
                                listScale: state.hostDetails?.reviewScale ?? [],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              const TermsSection(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Scaffold(body: SizedBox.shrink());
        });
      },
    );
  }
}
