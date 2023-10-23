import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/cards/card.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/inspiration_page/inspiration_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class InspirationScreen extends StatefulWidget {
  const InspirationScreen({Key? key}) : super(key: key);

  @override
  State<InspirationScreen> createState() => _InspirationScreenState();
}

class _InspirationScreenState extends State<InspirationScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  final AppRouter appRouter = GetIt.I<AppRouter>();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    context.read<InspirationBloc>().add(const GetListArticles(false));
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;
    final maxScroll = scrollController.position.maxScrollExtent.h;
    final currentScroll = scrollController.position.pixels.h;
    if (currentScroll == maxScroll) {
      context.read<InspirationBloc>().add(const GetListArticles(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        excludeHeaderSemantics: true,
        forceMaterialTransparency: true,
        title: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Text(
            "Inspirations",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
            child: Divider(
              height: 1,
              thickness: 1,
            ),
            preferredSize: Size.fromHeight(16.0)),
      ),
      body: BlocBuilder<InspirationBloc, InspirationState>(
        builder: (context, state) {
          if (state.status == StateStatus.loading &&
              state.listArticles!.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == StateStatus.error &&
              state.atTheEndOfThePage == false) {
            return const Center(child: Text("Pas des articles"));
          } else if (state.status == StateStatus.success ||
              state.status == StateStatus.loadingMore &&
                  state.listArticles!.isNotEmpty) {
            return Scaffold(
                bottomNavigationBar: state.status == StateStatus.loadingMore
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
                  controller: scrollController,
                  itemBuilder: (context, index) => CardArticle(
                    onTap: () {
                      appRouter.push(ArticleDetailsRoute(
                        id: state.listArticles?[index].id,
                      ));
                    },
                    catArticle: state.listArticles?[index].catName,
                    title: state.listArticles?[index].title,
                    content: state.listArticles?[index].content,
                    url: state.listArticles?[index].imageId,
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20.h);
                  },
                  itemCount: state.listArticles!.length,
                ));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
