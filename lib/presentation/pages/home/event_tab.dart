import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/cards/cards.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:intl/intl.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with AutomaticKeepAliveClientMixin {
  // final ScrollController _scrollController = ScrollController();
  final AppRouter appRouter = GetIt.I<AppRouter>();

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
    context.read<HomeBloc>().add(const GetListEvent(false));
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
        context.read<HomeBloc>().add(const GetSearchListEvent(true));
      } else if (context.read<HomeBloc>().state.isFilter == true) {
        context.read<HomeBloc>().add(const GetFilterListEventsPageData(true));
      } else {
        context.read<HomeBloc>().add(const GetListEvent(true));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.statusEvent == StateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.statusEvent == StateStatus.error &&
            state.atTheEndOfThePageEvents == false) {
          return const Center(child: Text("Pas des evénements"));
        } else if (state.statusEvent == StateStatus.error &&
            state.atTheEndOfTheSearchPageEvents == false &&
            state.isSearch == true) {
          return const Center(child: Text("Pas des evénements"));
        } else if (state.status == StateStatus.error &&
            state.atTheEndOfTheFilterPageEvents == false &&
            state.isFilter == true) {
          return const Center(child: Text("Pas des evénements"));
        } else if (state.statusEvent == StateStatus.success ||
            state.statusEvent == StateStatus.loadingMore &&
                state.listEvents!.isNotEmpty) {
          return Scaffold(
              bottomNavigationBar: state.statusEvent == StateStatus.loadingMore
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
                itemBuilder: (context, index) => CustomCard.event(
                  onTap: () {
                    appRouter.push(EventDetailsRoute(
                      id: state.listEvents?[index].id,
                    ));
                  },
                  discount: state.listEvents?[index].promotion.toString(),
                  type: state.listEvents?[index].slug,
                  title: state.listEvents?[index].title,
                  adress: state.listEvents?[index].address,
                  price: state.listEvents?[index].prix,
                  term: state.listEvents?[index].termName != null
                      ? getTermName(state.listEvents?[index].termName ?? "")
                      : "",
                  url: state.listEvents?[index].imageUrl,
                  isExpired:
                      state.listEvents?[index].isExpired == 1 ? true : false,
                  isFull: state.listEvents?[index].isfull == 1 ? true : false,
                  date: DateFormat('dd-MM-yyyy').format(
                      state.listEvents?[index].startDate ?? DateTime.now()),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.h);
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

  String getTermName(String terms) {
    List<String> listTerms = terms.split(",");
    if (listTerms.length == 1) {
      return listTerms.first;
    } else {
      return "${listTerms.first} , ${listTerms.last}";
    }
  }
}
