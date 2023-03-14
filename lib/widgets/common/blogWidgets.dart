import 'package:flutter/material.dart';

import '../../screens/blogPage.dart';
import '../../screens/homePage.dart';
import '../../utils/colors.dart';

class BlogHeader extends StatelessWidget {
  String articleTitle;
  bool isBlogPage;
  String category;
  BlogHeader(
      {Key? key,
      this.isBlogPage = true,
      this.articleTitle = "",
      this.category = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SeprationDot(),
              GestureDetector(
                onTap: () {
                  if (isBlogPage == false)
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogPage(),
                        ));
                },
                child: NavText("Blog"),
              ),
              SeprationDot(),
              Flexible(
                child: Text(
                  category != "" ? category : articleTitle,
                  style: TextStyle(
                      color: grey, fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: const Divider(thickness: 1)),
      ],
    );
  }
}

class SeprationDot extends StatelessWidget {
  const SeprationDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: primaryGrey, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class NavText extends StatelessWidget {
  String title;
  NavText(
    this.title,
  );

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
