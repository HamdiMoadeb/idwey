import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/services/blogCalls.dart';
import 'package:idwey/widgets/listItems/blogListItem.dart';

import '../../models/blog.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/blogWidgets.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  List<Blog> listBlogs = [];
  int listLengthFromLastCall = 0;
  bool loading = false;
  bool showFAB = false;
  String category = '';
  callBlogs() {
    setState(() {
      loading = true;
    });
    BlogCalls.getAllBlogs(listBlogs.length, category).then((result) async {
      setState(() {
        listLengthFromLastCall = result.length;
        listBlogs.addAll(result);
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  void initState() {
    super.initState();
    checkInternetConnectivity(context, callBlogs);
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 2000) >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange &&
          !loading &&
          !(listLengthFromLastCall < 10)) {
        callBlogs();
      }

      if (scrollController.position.pixels > 1000) {
        setState(() {
          showFAB = true;
        });
      }
      if (scrollController.position.pixels < 1000) {
        setState(() {
          showFAB = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
      showFab: showFAB,
      backtotop: scrollToTop,
      scaffoldKey: _scaffoldKey,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlogHeader(
              category: category,
            ),
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.only(bottom: 40, right: 15),
                      child: BlogPageItems(
                        categoryFilter: () {
                          scrollToTop();
                          Future.delayed(
                              scrollController.position.pixels == 0
                                  ? Duration(milliseconds: 0)
                                  : Duration(milliseconds: 1100), () {
                            setState(() {
                              loading = true;
                              category =
                                  listBlogs[index].cat_name!.toLowerCase();
                              listBlogs = [];
                            });
                            callBlogs();
                          });
                        },
                        blog: listBlogs[index],
                      )),
                  itemCount: listBlogs.length,
                ),
              ],
            ),
            loading
                ? Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(primary),
                      ),
                    ),
                  )
                : Container(),
            Footer(),
            CreatedBy(),
            BackToTop(scrollToTop),
          ],
        ),
      ),
    );
  }
}