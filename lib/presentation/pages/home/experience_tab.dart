import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/cards/cards.dart';
import 'package:idwey/constants/enums.dart';

import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen>
    with AutomaticKeepAliveClientMixin {
  final AppRouter appRouter = GetIt.I<AppRouter>();

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
    context.read<HomeBloc>().add(const GetListExperiences(false));
  }

  @override
  void dispose() {
    widget.scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) return;
    final maxScroll = widget.scrollController.position.maxScrollExtent.h;
    final currentScroll = widget.scrollController.position.pixels.h;
    if (currentScroll == maxScroll) {
      if (context.read<HomeBloc>().state.isSearch == true) {
        context.read<HomeBloc>().add(const GetSearchListExperiences(true));
      } else if (context.read<HomeBloc>().state.isFilter == true) {
        context
            .read<HomeBloc>()
            .add(const GetFilterListExperiencesPageData(true));
      } else {
        context.read<HomeBloc>().add(const GetListExperiences(true));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.statusExperiences == StateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.statusExperiences == StateStatus.error &&
            state.atTheEndOfThePageExperiences == false) {
          return const Center(child: Text("Pas des experiences"));
        } else if (state.statusExperiences == StateStatus.error &&
            state.atTheEndOfThePageExperiences == false &&
            state.isSearch == true) {
          return const Center(child: Text("Pas des experiences"));
        } else if (state.status == StateStatus.error &&
            state.atTheEndOfTheFilterPageExperiences == false &&
            state.isFilter == true) {
          return const Center(child: Text("Pas des experiences"));
        } else if (state.statusExperiences == StateStatus.success &&
            state.listExperiences?.isEmpty == true) {
          return const Center(child: Text("Pas des experiences"));
        } else if (state.statusExperiences == StateStatus.success ||
            state.statusExperiences == StateStatus.loadingMore &&
                state.listExperiences!.isNotEmpty) {
          return Scaffold(
              backgroundColor: secondaryGrey,
              bottomNavigationBar:
                  state.statusExperiences == StateStatus.loadingMore
                      ? BottomAppBar(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            child: LinearProgressIndicator(
                              color: Colors.grey,
                              backgroundColor: Colors.grey[300]!,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
              body: ListView.separated(
                padding: EdgeInsets.only(
                    top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
                shrinkWrap: true,
                controller: widget.scrollController,
                itemBuilder: (context, index) => CustomCard.experience(
                  onTap: () {
                    appRouter.push(ExperienceDetailsRoute(
                      id: state.listExperiences?[index].id,
                    ));
                  },
                  discount: state.listExperiences?[index].promotion.toString(),
                  title: state.listExperiences?[index].title,
                  adress: state.listExperiences?[index].address,
                  price: state.listExperiences?[index].price,
                  type: state.listExperiences?[index].catName,
                  duration: state.listExperiences?[index].duration,
                  isFeatured:
                      state.listExperiences?[index].isFeatured != null &&
                              state.listExperiences?[index].isFeatured == 1
                          ? true
                          : false,
                  //  term: state.listActivities?[index].termName,
                  url: state.listExperiences?[index].imageUrl,
                  nbPerson:
                      " ${state.listExperiences?[index].maxPeople} personnes",
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: state.listExperiences!.length,
              ));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
