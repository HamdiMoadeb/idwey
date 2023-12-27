import 'package:auto_route/annotations.dart';
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
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/pages/details_page/components/commodite_section/commodite_section.dart';
import 'package:idwey/presentation/pages/details_page/components/map_section/map_section.dart';
import 'package:idwey/presentation/pages/details_page/components/reviews_section/reviews_section.dart';
import 'package:idwey/presentation/pages/details_page/components/type_capacite_section/type_capacite_section.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class EventDetailsScreen extends StatefulWidget {
  final int? id;
  const EventDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen>
    with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  bool showAppBar = false;

  @override
  void initState() {
    BlocProvider.of<DetailsEventPageBloc>(context)
        .add(DetailsEventPageEvent.getEventDetails(widget.id ?? 0));

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
        return BlocBuilder<DetailsEventPageBloc, DetailsEventPageState>(
            builder: (context, state) {
          print("widget.typeHost");
          print(state.eventDetailsDto?.row?.promotion);
          if (state.status == StateStatus.loading) {
            return const Center(
              child: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          } else if (state.status == StateStatus.error &&
              state.eventDetailsDto == null) {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          } else if (state.status == StateStatus.success &&
              state.eventDetailsDto != null) {
            return Scaffold(
              bottomNavigationBar: BottomAppBar(
                child: BottomReservationBar(
                  onPressed: () {
                    appState.isLoggedIn == true
                        ? GetIt.I<AppRouter>().push(
                            VerifyDisponibilityRoute(
                              subtitle:
                                  "${double.parse(state.eventDetailsDto?.row?.prix ?? "0").toInt()} DT par personne",
                              url: state.eventDetailsDto?.bannerImageUrl ?? "",
                              typeReservation: TypeReservation.event,
                              perPerson: "personne",
                              //typeHost: widget.eventDetailsDto,
                              salePrice: state.eventDetailsDto?.row?.prix ?? "",
                              price: state.eventDetailsDto?.row?.prix ?? "",

                              id: state.eventDetailsDto?.row?.id.toString() ??
                                  "",
                              title: state.eventDetailsDto?.row?.title ?? "",
                              address:
                                  state.eventDetailsDto?.row?.address ?? "",
                              startDate:
                                  state.eventDetailsDto?.row?.startDate ??
                                      DateTime.now(),
                              endDate: state.eventDetailsDto?.row?.endDate ??
                                  DateTime.now(),
                              activityDuration:
                                  state.eventDetailsDto?.row?.duration ?? "",
                              // extraPrice: state.extraPrice ?? [],
                              // .. rooms: state.hostDetails?.rooms ?? [],
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
                  stateEvent: state.eventDetailsDto?.row?.isExpired == 1
                      ? StateEvent.isExpired
                      : state.eventDetailsDto?.row?.isfull == 1
                          ? StateEvent.isFull
                          : StateEvent.isAvailable,
                  perPerson: "personne",
                  salePrice:
                      double.parse(state.eventDetailsDto?.row?.salePrix ?? "0")
                          .toInt()
                          .toString(),
                  price: double.parse(state.eventDetailsDto?.row?.prix ?? "0")
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
                        bannerWidget: ImageBannerSingle(
                            urlImage:
                                state.eventDetailsDto?.bannerImageUrl ?? ""),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 12.w, right: 12.w, top: 10.h, bottom: 40.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.eventDetailsDto?.row?.title ?? "",
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
                                    visible: state.eventDetailsDto?.row
                                                ?.promotion !=
                                            null &&
                                        state.eventDetailsDto?.row?.promotion !=
                                            "" &&
                                        state.eventDetailsDto?.row?.promotion !=
                                            "null",
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 16.w),
                                      child: CircleAvatar(
                                        radius: 24.r,
                                        child: Text(
                                          "-${state.eventDetailsDto?.row?.promotion}‰ ",
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
                              state.eventDetailsDto?.row?.address == null ||
                                      state.eventDetailsDto?.row?.address == ""
                                  ? const SizedBox.shrink()
                                  : Row(
                                      children: [
                                        HeroIcon(
                                          HeroIcons.mapPin,
                                          color: primary,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          state.eventDetailsDto?.row?.address ??
                                              "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: primary),
                                        ),
                                      ],
                                    ),
                              ExpandableDescription(
                                description:
                                    state.eventDetailsDto?.row?.content ?? "",
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
                                typeReservation: TypeReservation.event,
                                duration: state.eventDetailsDto?.row?.duration
                                        .toString() ??
                                    "",
                                difficulty: state
                                        .eventDetailsDto?.row?.difficulty
                                        .toString() ??
                                    "",
                                capacite: state.eventDetailsDto?.remainingPlaces
                                        .toString() ??
                                    "",
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              CommoditiesSection(
                                typeReservation: TypeReservation.event,
                                listCommodities:
                                    state.eventDetailsDto?.attributes != null &&
                                            state.eventDetailsDto?.attributes!
                                                    .containsKey('10') ==
                                                true
                                        ? state.eventDetailsDto
                                                ?.attributes!['10']!.child ??
                                            []
                                        : [],
                              ),
                              MapSection(
                                title: state.eventDetailsDto?.row?.title ?? "",
                                lat: state.eventDetailsDto?.row?.mapLat ?? "",
                                lng: state.eventDetailsDto?.row?.mapLng ?? "",
                              ),
                              const Divider(),
                              ReviewsSection(
                                type: "event",
                                id: state.eventDetailsDto?.row?.id.toString() ??
                                    "",
                                canReview: state.eventDetailsDto?.canreview == 0
                                    ? false
                                    : true,
                                reviews:
                                    state.eventDetailsDto?.reviewList ?? [],
                                averageRating: state.eventDetailsDto?.moyRate
                                        ?.toString() ??
                                    "0",
                                reviewsNumber: state
                                        .eventDetailsDto?.reviewList?.length
                                        .toString() ??
                                    "0",
                                listScale:
                                    state.eventDetailsDto?.reviewScale ?? [],
                              ),
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
