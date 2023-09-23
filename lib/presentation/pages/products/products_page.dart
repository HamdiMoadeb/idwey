import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/cards/card.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  final AppRouter appRouter = GetIt.I<AppRouter>();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    context.read<ProductsBloc>().add(const GetListProducts(false));
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
      context.read<ProductsBloc>().add(const GetListProducts(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Text(
            "Jeux et produits",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
            child: Divider(
              thickness: 1,
              height: 1,
            ),
            preferredSize: Size.fromHeight(16.0)),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state.status == StateStatus.loading &&
              state.listArticles!.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == StateStatus.error &&
              state.atTheEndOfThePage == false) {
            return const Center(child: Text("Pas des produits"));
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
                  itemBuilder: (context, index) => CustomCard.product(
                    onTap: () {
                      appRouter.push(DetailsProductRoute(
                        id: state.listArticles?[index].id,
                      ));
                    },
                    title: state.listArticles?[index].title,
                    price: state.listArticles?[index].price,
                    adress: state.listArticles?[index].termName,
                    url: state.listArticles?[index].imageUrl,
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
