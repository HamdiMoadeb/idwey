import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class ArticleDetailsScreen extends StatefulWidget {
  final int? id;
  const ArticleDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen>
    with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  bool showAppBar = false;

  @override
  void initState() {
    BlocProvider.of<ArticleDetailsBloc>(context)
        .add(ArticleDetailsEvent.getArticleDetails(widget.id ?? 0));

    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailsBloc, ArticleDetailsState>(
        builder: (context, state) {
      if (state.status == StateStatus.loading) {
        return const Center(
          child: Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      } else if (state.status == StateStatus.error &&
          state.articleDetailsDto == null) {
        return const Scaffold(
          body: Center(
            child: Text("Error"),
          ),
        );
      } else if (state.status == StateStatus.success &&
          state.articleDetailsDto != null) {
        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                controller: scrollController,
                slivers: [
                  CustomSliverAppBar(
                    bannerWidget: ImageBannerSingle(
                        urlImage: state.articleDetailsDto?.imageUrl ?? ""),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 12.w, right: 12.w, top: 10.h, bottom: 40.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.h),
                            child: Text(
                              state.articleDetailsDto?.row?.title ?? "",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: primary),
                            ),
                          ),
                          Html(
                            //  key: _widgetKey,
                            data: state.articleDetailsDto?.row?.content ?? "",
                            style: {
                              "body": Style(
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                                fontSize: FontSize(Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.fontSize ??
                                    14),
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.fontFamily,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.fontWeight,
                              ),
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
      return const Scaffold(body: SizedBox.shrink());
    });
  }
}
