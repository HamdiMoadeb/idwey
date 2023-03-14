import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:idwey/models/blog.dart';
import 'package:idwey/services/blogCalls.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widgets/common/blogWidgets.dart';
import '../widgets/common/footer.dart';
import '../widgets/common/scaffold.dart';
import '../widgets/listItems/blogListItem.dart';
import 'blogPage.dart';
import 'homePage.dart';

class ArticleDetailsPage extends StatefulWidget {
  int id;
  ArticleDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  bool loading = false;
  bool showFAB = false;
  ArticleDetail articleDetail = ArticleDetail(0, '', '', '', '', '', '');

  callArticle() {
    setState(() {
      loading = true;
    });
    BlogCalls.getArticleDetails(widget.id).then((article) async {
      setState(() {
        articleDetail = article;
        articleDetail.content = articleDetail.content
            ?.replaceAll("/uploads/", "https://idwey.tn/uploads/");
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    checkInternetConnectivity(context, callArticle);
    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    print(articleDetail.content);
    return CommonScaffold(
      showFab: showFAB,
      backtotop: scrollToTop,
      scaffoldKey: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loading
                    ? Container(
                        height: 300,
                        margin: EdgeInsets.all(30),
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(primary),
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlogHeader(isBlogPage: false),
                          Container(
                            height: 220,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    width: double.infinity,
                                    imageUrl: articleDetail.image_url!,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 32,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: primaryOrange,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15))),
                                    child: Center(
                                      child: Text(
                                        '${articleDetail.cat_name}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Text(
                              '${articleDetail.title}',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: titleBlack),
                            ),
                          ),
                          AuthorAndDate(
                            author: 'Idwey',
                            date: articleDetail.created_at,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20),
                            child: HtmlWidget(
                              articleDetail.content!,
                            ),
                          ),
                        ],
                      ),
                Footer(),
                CreatedBy(),
                BackToTop(scrollToTop),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
