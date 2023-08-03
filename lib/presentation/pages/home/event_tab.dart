import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idwey/components/cards/cards.dart';
import 'package:idwey/constants/enums.dart';

import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:intl/intl.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<HomeBloc>().add(const GetListEvent(false));
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
      context.read<HomeBloc>().add(const GetListEvent(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.statusEvent == StateStatus.loading &&
            state.listEvents!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.statusEvent == StateStatus.error) {
          return const Center(child: Text("Pas des hébergements"));
        } else if (state.statusEvent == StateStatus.success &&
            state.listEvents!.isNotEmpty) {
          return Scaffold(
              body: ListView.separated(
            padding: EdgeInsets.only(top: 30),
            shrinkWrap: true,
            controller: _scrollController,
            itemBuilder: (context, index) => CustomCard.event(
              type: state.listEvents?[index].slug,
              title: state.listEvents?[index].title,
              adress: state.listEvents?[index].address,
              price: state.listEvents?[index].prix,
              term: state.listEvents?[index].termName,
              url: state.listEvents?[index].imageUrl,
              date: DateFormat('dd-MM-yyyy')
                  .format(state.listEvents?[index].startDate ?? DateTime.now()),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: state.listEvents!.length,
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
