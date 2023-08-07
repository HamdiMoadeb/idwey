import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
//  final ScrollController _scrollController = ScrollController();

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
      context.read<HomeBloc>().add(const GetListExperiences(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.statusExperiences == StateStatus.loading &&
            state.listExperiences!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.statusExperiences == StateStatus.error &&
            state.atTheEndOfThePage == false) {
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
                padding: EdgeInsets.only(top: 16.h, left: 12.w, right: 12.w),
                shrinkWrap: true,
                controller: widget.scrollController,
                itemBuilder: (context, index) => CustomCard.experience(
                  title: state.listExperiences?[index].title,
                  adress: state.listExperiences?[index].address,
                  price: state.listExperiences?[index].price,
                  type: state.listExperiences?[index].catName,
                  duration: state.listExperiences?[index].duration,
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
