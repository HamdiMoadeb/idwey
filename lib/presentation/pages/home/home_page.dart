import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idwey/components/app_bar/app_bar.dart';
import 'package:idwey/components/cards/cards.dart';
import 'package:idwey/constants/enums.dart';

import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
    context.read<HomeBloc>().add(const GetListHost(false));

    _scrollToTop();
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
      context.read<HomeBloc>().add(const GetListHost(true));
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == StateStatus.loading && state.listHosts!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == StateStatus.error) {
          return const Center(child: Text("Pas des hébergements"));
        } else if (state.status == StateStatus.success &&
            state.listHosts!.isNotEmpty) {
          return Scaffold(
              backgroundColor: secondaryGrey,
              body: ListView.separated(
                padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (context, index) => CustomCard.host(
                  title: state.listHosts?[index].title,
                  adress: state.listHosts?[index].address,
                  price: state.listHosts?[index].price,
                  type: state.listHosts?[index].typeHost,
                  term: state.listHosts?[index].termName,
                  url: state.listHosts?[index].imageUrl,
                  nbPerson: " ${state.listHosts?[index].maxPerson} personnes",
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
                itemCount: state.listHosts!.length,
              ));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  void updateKeepAlive() {
    _scrollToTop();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
