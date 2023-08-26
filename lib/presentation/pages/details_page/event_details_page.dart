import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/bottom_bar.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/components/read_more_text.dart';
import 'package:idwey/components/verify_disponibility_bottom_sheet_content/bottom_sheet.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/pages/details_page/components/commodite_section/commodite_section.dart';
import 'package:idwey/presentation/pages/details_page/components/map_section/map_section.dart';
import 'package:idwey/presentation/pages/details_page/components/reviews_section/reviews_section.dart';
import 'package:idwey/presentation/pages/details_page/components/type_capacite_section/type_capacite_section.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:heroicons/heroicons.dart';

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
    scrollController.addListener(() {
      if (scrollController.position.pixels > 400) {
        setState(() {
          showAppBar = true;
        });
      } else {
        setState(() {
          showAppBar = false;
        });
      }
    });
    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsEventPageBloc, DetailsEventPageState>(
        builder: (context, state) {
      if (state.status == StateStatus.loading &&
          state.eventDetailsDto == null) {
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
                showModalBottomSheet(
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
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: const DraggableBottomSheet());
                  },
                );
              },
              perPerson: state.eventDetailsDto?.row?.number.toString() ?? "",
              price:
                  "${double.parse(state.eventDetailsDto?.row?.prix ?? "0").toInt().toString()} DT",
            ),
          ),
          body: Stack(
            children: [
              CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    collapsedHeight: 60.h,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    floating: true,
                    backgroundColor: Colors.transparent,
                    actions: [
                      Container(
                        height: 40.h,
                        width: 40.h,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: materialPrimary.withOpacity(0.8),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 40.h,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: materialPrimary.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                    leading: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: materialPrimary.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    elevation: 0,
                    flexibleSpace: showAppBar == true
                        ? Container(
                            color: Colors.grey[200],
                          )
                        : ImageBannerSingle(
                            urlImage:
                                state.eventDetailsDto?.bannerImageUrl ?? ""),
                    expandedHeight: 300.h,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 12.w, right: 12.w, top: 10.h, bottom: 40.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.eventDetailsDto?.row?.title ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
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
                                state.eventDetailsDto?.row?.address ?? "",
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
                          Text(
                            'Type • Capacite • Emplacment',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          TypeCapaciteSection(
                            typeReservation: TypeReservation.event,
                            duration: state.eventDetailsDto?.row?.duration
                                    .toString() ??
                                "",
                            difficulty: state.eventDetailsDto?.row?.difficulty
                                    .toString() ??
                                "",
                            capacite: state.eventDetailsDto?.remainingPlaces
                                    .toString() ??
                                "",
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const CommoditiesSection(
                            typeReservation: TypeReservation.event,
                            games: "Jeux",
                            food: "Nourriture",
                            breakfast: "Petit déjeuner",
                          ),
                          const Divider(),
                          MapSection(
                            lat: state.eventDetailsDto?.row?.mapLat ?? "",
                            lng: state.eventDetailsDto?.row?.mapLng ?? "",
                          ),
                          const Divider(),
                          const ReviewsSection(reviews: []),
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
  }
}
