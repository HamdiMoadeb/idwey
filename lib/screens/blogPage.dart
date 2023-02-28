import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/screens/homePage.dart';
import 'package:idwey/services/blogCalls.dart';
import 'package:idwey/widgets/listItems/blogListItem.dart';

import '../models/blog.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widgets/common/footer.dart';
import '../widgets/common/scaffold.dart';

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

  callBlogs() {
    setState(() {
      loading = true;
    });
    BlogCalls.getAllBlogs(listBlogs.length).then((result) async {
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
        duration: const Duration(seconds: 2), curve: Curves.linear);
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
            Container(
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 230,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset("assets/blogCover.jpg",
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Blog',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 15, right: 15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                      child: NavText("Accueil")),
                  Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: primaryGrey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  NavText("Blog")
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                child: const Divider(thickness: 1)),
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.only(bottom: 40, right: 15),
                      child: BlogPageItems(
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

class NavText extends StatelessWidget {
  String title;
  NavText(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(),
      child: Text(
        title,
        style: TextStyle(
            color: primary, fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}
