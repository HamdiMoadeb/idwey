import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/cards/cards.dart';
import 'package:idwey/constants/enums.dart';

import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with AutomaticKeepAliveClientMixin {
  // final ScrollController _scrollController = ScrollController();
  final AppRouter appRouter = GetIt.I<AppRouter>();
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
    context.read<HomeBloc>().add(const GetListActivities(false));
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
        context.read<HomeBloc>().add(const GetSearchListActivities(true));
      } else {
        context.read<HomeBloc>().add(const GetListActivities(true));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.statusActivities == StateStatus.loading &&
            state.listActivities!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.statusActivities == StateStatus.error &&
            state.atTheEndOfThePageActivities == false) {
          return const Center(child: Text("Pas des activites"));
        } else if (state.statusActivities == StateStatus.error &&
            state.atTheEndOfThePageActivities == true) {
          return const Center(child: Text("Pas des activites"));
        } else if (state.statusActivities == StateStatus.success &&
            state.listActivities!.isEmpty) {
          return const Center(child: Text("Pas des activites"));
        } else if (state.statusActivities == StateStatus.success ||
            state.statusActivities == StateStatus.loadingMore &&
                state.listActivities!.isNotEmpty) {
          return Scaffold(
              bottomNavigationBar:
                  state.statusActivities == StateStatus.loadingMore
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
              backgroundColor: secondaryGrey,
              body: ListView.separated(
                padding: EdgeInsets.only(
                    top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
                shrinkWrap: true,
                controller: widget.scrollController,
                itemBuilder: (context, index) => CustomCard.activity(
                  onTap: () {
                    appRouter.push(ActivityDetailsRoute(
                      id: state.listActivities?[index].id,
                    ));
                  },
                  discount: state.listActivities?[index].promotion.toString(),
                  title: state.listActivities?[index].title,
                  adress: state.listActivities?[index].address,
                  price: state.listActivities?[index].price,
                  type: state.listActivities?[index].title,
                  duration: state.listActivities?[index].duration,
                  isFeatured: state.listActivities?[index].isFeatured != null &&
                          state.listActivities?[index].isFeatured == 1
                      ? true
                      : false,
                  url: state.listActivities?[index].imageUrl,
                  nbPerson:
                      " ${state.listActivities?[index].maxPeople} personnes",
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: state.listActivities!.length,
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
