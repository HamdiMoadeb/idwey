import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
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
import 'package:heroicons/heroicons.dart';

@RoutePage()
class ExperienceDetailsScreen extends StatefulWidget {
  final int? id;
  const ExperienceDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ExperienceDetailsScreen> createState() =>
      _ExperienceDetailsScreenState();
}

class _ExperienceDetailsScreenState extends State<ExperienceDetailsScreen>
    with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  bool showAppBar = false;

  @override
  void initState() {
    BlocProvider.of<DetailsExperiencePageBloc>(context)
        .add(DetailsExperiencePageEvent.getExperienceDetails(widget.id ?? 0));

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
        return BlocBuilder<DetailsExperiencePageBloc,
            DetailsExperiencePageState>(builder: (context, state) {
          print("widget.typeHost");
          print(state.experienceDetailsDto?.attributes?.the11?.child);

          if (state.status == StateStatus.loading) {
            return const Center(
              child: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          } else if (state.status == StateStatus.error &&
              state.experienceDetailsDto == null) {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          } else if (state.status == StateStatus.success &&
              state.experienceDetailsDto != null) {
            return Scaffold(
              bottomNavigationBar: BottomAppBar(
                child: BottomReservationBar(
                  onPressed: () {
                    appState.isLoggedIn == true
                        ? GetIt.I<AppRouter>().push(
                            VerifyDisponibilityRoute(
                              subtitle:
                                  "${double.parse(state.experienceDetailsDto?.row?.price ?? '0').toInt()} DT par personne",
                              url: state.experienceDetailsDto?.bannerImageUrl ??
                                  "",
                              typeReservation: TypeReservation.experience,
                              //typeHost: widget.eventDetailsDto,
                              salePrice:
                                  state.experienceDetailsDto?.row?.price ?? "",
                              price:
                                  state.experienceDetailsDto?.row?.price ?? "",

                              id: state.experienceDetailsDto?.row?.id
                                      .toString() ??
                                  "",
                              title:
                                  state.experienceDetailsDto?.row?.title ?? "",
                              address:
                                  state.experienceDetailsDto?.row?.address ??
                                      "",
                              activityDuration:
                                  state.experienceDetailsDto?.row?.duration ??
                                      "",
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
                  perPerson: "personne",
                  salePrice:
                      "${double.parse(state.experienceDetailsDto?.row?.salePrice ?? "0").toInt().toString()}",
                  price:
                      "${double.parse(state.experienceDetailsDto?.row?.price ?? "0").toInt().toString()}",
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
                                state.experienceDetailsDto?.bannerImageUrl ??
                                    ""),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 12.w, right: 12.w, top: 10.h, bottom: 40.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.experienceDetailsDto?.row?.title ??
                                          "",
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
                                    visible: state.experienceDetailsDto?.row
                                            ?.promotion
                                            ?.toString()
                                            ?.isNotEmpty ??
                                        false,
                                    child: CircleAvatar(
                                      child: Text(
                                        "${state.experienceDetailsDto?.row?.promotion}/ DT",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
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
                                    state.experienceDetailsDto?.row?.address ??
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
                                    state.experienceDetailsDto?.row?.content ??
                                        "",
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
                                duration: state
                                        .experienceDetailsDto?.row?.duration
                                        .toString() ??
                                    "",
                                capacite: state
                                        .experienceDetailsDto?.row?.maxPeople
                                        .toString() ??
                                    "",
                                experience:
                                    state.experienceDetailsDto?.row?.catName ??
                                        "",
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              CommoditiesSection(
                                typeReservation: TypeReservation.event,
                                listCommodities: state.experienceDetailsDto
                                        ?.attributes?.the11?.child ??
                                    [],
                              ),
                              const Divider(),
                              MapSection(
                                title: state.experienceDetailsDto?.row?.title ??
                                    "",
                                lat: state.experienceDetailsDto?.row?.mapLat ??
                                    "",
                                lng: state.experienceDetailsDto?.row?.mapLng ??
                                    "",
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
      },
    );
  }
}
