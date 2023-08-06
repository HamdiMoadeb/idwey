import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idwey/components/app_bar/app_bar.dart';
import 'package:idwey/components/cards/cards.dart';
import 'package:idwey/constants/enums.dart';

import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
    context.read<HomeBloc>().add(const GetListActivities(false));
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<HomeBloc>().add(const GetListActivities(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.statusActivities == StateStatus.loading &&
            state.listActivities!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.statusActivities == StateStatus.error &&
            state.atTheEndOfThePage == false) {
          return const Center(child: Text("Pas des activites"));
        } else if (state.statusActivities == StateStatus.success ||
            state.statusActivities == StateStatus.loadingMore &&
                state.listActivities!.isNotEmpty) {
          return Scaffold(
              bottomNavigationBar:
                  state.statusActivities == StateStatus.loadingMore
                      ? BottomAppBar(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: LinearProgressIndicator(
                              color: Colors.grey,
                              backgroundColor: Colors.grey[300]!,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
              backgroundColor: secondaryGrey,
              body: ListView.separated(
                padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (context, index) => CustomCard.activity(
                  title: state.listActivities?[index].title,
                  adress: state.listActivities?[index].address,
                  price: state.listActivities?[index].price,
                  type: state.listActivities?[index].catName,
                  duration: state.listActivities?[index].duration,
                  //  term: state.listActivities?[index].termName,
                  url: state.listActivities?[index].imageUrl,
                  nbPerson:
                      " ${state.listActivities?[index].maxPeople} personnes",
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
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
