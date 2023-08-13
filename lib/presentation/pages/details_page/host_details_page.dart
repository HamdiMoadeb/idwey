import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idwey/components/bottom_bar.dart';
import 'package:idwey/components/cards/card.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/components/read_more_text.dart';
import 'package:idwey/components/verify_disponibility_bottom_sheet_content/bottom_sheet.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/details_host_bloc/details_page_bloc.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:heroicons/heroicons.dart';

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

  @override
  void initState() {
    BlocProvider.of<DetailsPageBloc>(context)
        .add(DetailsPageEvent.getHostDetails(widget.id ?? 0));
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
    return BlocBuilder<DetailsPageBloc, DetailsPageState>(
        builder: (context, state) {
      if (state.status == StateStatus.loading && state.hostDetails == null) {
        return const Center(
          child: Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      } else if (state.status == StateStatus.error &&
          state.hostDetails == null) {
        return const Center(
          child: Text("Error"),
        );
      } else if (state.status == StateStatus.success &&
          state.hostDetails != null) {
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
                        child: DraggableBottomSheet());
                  },
                );
              },
              per_person: state.hostDetails?.row?.perPerson ?? "",
              price:
                  "${double.parse(state.hostDetails?.row?.price ?? "0").toInt().toString()} DT",
            ),
          ),
          body: Stack(
            children: [
              CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    collapsedHeight: 70.h,
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
                            color: materialPrimary.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(50)),
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
                            borderRadius: BorderRadius.circular(50)),
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
                        : ImageBanner(
                            listImages:
                                state.hostDetails?.galleryImagesUrl ?? []),
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
                            state.hostDetails?.row?.title ?? "",
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
                                state.hostDetails?.row?.address ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: primary),
                              ),
                            ],
                          ),
                          ExpandableDescription(
                            description: state.hostDetails?.row?.content ?? "",
                            readMoreLabel: "Lire la suite",
                            readLessLabel: "Lire moins",
                            maxLines: 3,
                            isExpandable: true,
                            //padding: const EdgeInsets.symmetric(vertical: 10),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                FilterItemType(
                                  icon: SvgPicture.asset(
                                    Assets.house,
                                    height: 45.h,
                                    width: 45.w,
                                  ),
                                  label: state.hostDetails?.attributes?["5"]
                                          ?.child?[0] ??
                                      "",
                                ),
                                FilterItemType(
                                  icon: SvgPicture.asset(
                                    Assets.userGroup,
                                    height: 45.h,
                                    width: 45.w,
                                  ),
                                  label:
                                      "${state.hostDetails?.row?.maxPerson} personnes",
                                ),
                                FilterItemType(
                                  icon: SvgPicture.asset(
                                    Assets.beachArea,
                                    height: 45.h,
                                    width: 45.w,
                                  ),
                                  label: state.hostDetails?.attributes?["6"]
                                          ?.child?[0] ??
                                      "",
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Commodités',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.shower),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Douche',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.parking),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Free Parking',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.kitchen),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Cuisine équipée',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Text(
                            'Emplacement',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Container(
                              height: 300.h,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: MapPosition(
                                title: "title",
                                lat: double.tryParse(
                                        state.hostDetails?.row?.mapLat ?? "") ??
                                    0,
                                lng: double.tryParse(
                                        state.hostDetails?.row?.mapLng ?? "") ??
                                    0,
                              )),
                          const Divider(),
                          Row(
                            children: [
                              const Icon(Icons.star),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '4.95 • 22 reviews',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 210.h,
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return const CardReview(
                                        text:
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget nunc ut dignissim.,consectetur adipiscing elit. Sed ut purus eget nunc ut dignissim.,consectetur adipiscing elit. Sed ut purus eget nunc ut dignissim. ",
                                        reviewer: 'Reviewer',
                                        date: '4 months ago',
                                      );
                                    },
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        width: 8.w,
                                      );
                                    },
                                    itemCount: 5),
                              ),

                              /// secondary button to review all reviews if there is more than 5
                              Visibility(
                                visible: true,
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        side: const BorderSide(
                                            color: Colors.black, width: 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r))),
                                    child: Text(
                                      "Afficher les 22 avis",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () {}),
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Règles de la maison',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.verified_user),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Entrée : 14:00"),
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.verified_user),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Sortie : 14:00"),
                                ],
                              )
                            ],
                          )
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
      return Scaffold(body: const SizedBox.shrink());
    });
  }
}

class MapPosition extends StatefulWidget {
  double lat;
  double lng;
  String title;
  MapPosition(
      {Key? key, required this.lat, required this.lng, required this.title})
      : super(key: key);

  @override
  State<MapPosition> createState() => _MapPositionState();
}

class _MapPositionState extends State<MapPosition> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> markers = Set();

  @override
  void initState() {
    markers.add(Marker(
      markerId: const MarkerId("location"),
      position: LatLng(widget.lat, widget.lng), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: '${widget.title}',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    //you can add more markers here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: GoogleMap(
          zoomControlsEnabled: false,
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer())
          },
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.lat, widget.lng),
            zoom: 11.0,
          ),
          markers: markers),
    );
  }
}
