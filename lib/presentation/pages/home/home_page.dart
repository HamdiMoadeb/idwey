import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/cards/cards.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  //final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);

    context.read<HomeBloc>().add(const GetListHost(false));

    //  _scrollToTop();
  }

  @override
  void dispose() {
    widget.scrollController!
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!widget.scrollController!.hasClients) return;
    final maxScroll = widget.scrollController!.position.maxScrollExtent.h;
    final currentScroll = widget.scrollController!.position.pixels.h;
    if (currentScroll == maxScroll) {
      context.read<HomeBloc>().add(const GetListHost(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == StateStatus.loading && state.listHosts!.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == StateStatus.error &&
            state.atTheEndOfThePage == false) {
          return const Center(child: Text("Pas des hébergements"));
        } else if (state.status == StateStatus.success ||
            state.status == StateStatus.loadingMore &&
                state.listHosts!.isNotEmpty) {
          return Scaffold(
              backgroundColor: secondaryGrey,
              bottomNavigationBar: state.status == StateStatus.loadingMore
                  ? BottomAppBar(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0.w, vertical: 16.h),
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
                  return SizedBox(height: 16.h);
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
    // _scrollToTop();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
