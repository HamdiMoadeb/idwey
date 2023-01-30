import 'package:flutter/material.dart';
import 'package:idwey/models/blog.dart';
import 'package:idwey/services/homePageCalls.dart';
import 'package:idwey/widgets/listItems/blogListItem.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/colors.dart';

class BlogListSection extends StatefulWidget {
  const BlogListSection({Key? key}) : super(key: key);

  @override
  State<BlogListSection> createState() => _BlogListSectionState();
}

class _BlogListSectionState extends State<BlogListSection> {
  List<Blog> blogs = [];
  final AutoScrollController controller = AutoScrollController();

  int _currentFocusedIndex = 0;

  getAllBlogs() {
    HomePageCalls.getAllBlogs().then((list) {
      setState(() {
        blogs = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getAllBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 15),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  'Inspirations',
                  style: TextStyle(
                    color: primary,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    child: Icon(
                      Icons.navigate_before_sharp,
                      color: primary,
                      size: 25,
                    ),
                    onPressed: () {
                      if (_currentFocusedIndex > 0) {
                        _currentFocusedIndex--;
                        controller.scrollToIndex(_currentFocusedIndex,
                            preferPosition: AutoScrollPosition.begin);

                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.white,
                      shape: CircleBorder(
                          side: BorderSide(
                        color: Colors.grey.shade300,
                      )),
                      padding: EdgeInsets.zero,
                      primary: Colors.white,
                    )),
              ),
              Container(
                width: 30,
                height: 30,
                child: ElevatedButton(
                    child: Icon(
                      Icons.navigate_next_sharp,
                      color: primary,
                      size: 25,
                    ),
                    onPressed: () {
                      if (_currentFocusedIndex < blogs.length - 1) {
                        _currentFocusedIndex++;
                        controller.scrollToIndex(_currentFocusedIndex,
                            preferPosition: AutoScrollPosition.begin);
                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.white,
                      shape: CircleBorder(
                          side: BorderSide(
                        color: Colors.grey.shade300,
                      )),
                      padding: EdgeInsets.zero,
                      primary: Colors.white,
                    )),
              ),
            ],
          ),
        ),
        Container(
          height: 410,
          margin: EdgeInsets.only(top: 5, bottom: 20, right: 15),
          child: ListView.builder(
            controller: controller,
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => AutoScrollTag(
              key: ValueKey(index),
              controller: controller,
              index: index,
              child: VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (info.visibleFraction == 1) {
                    setState(() {
                      _currentFocusedIndex = index;
                    });
                  }
                },
                child: BlogListItem(blogs[index]),
              ),
            ),
            itemCount: blogs.length,
          ),
        ),
      ],
    );
  }
}
