import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idwey/screens/articleDetailsPage.dart';
import 'package:idwey/screens/blogPage.dart';
import 'package:intl/intl.dart';

import '../../models/blog.dart';
import '../../utils/colors.dart';

getDateFormat(String date) {
  DateTime tempDate = DateFormat("yyyy-MM-dd").parse(date);
  String newDate = DateFormat('dd/MM/yyyy').format(tempDate);
  return newDate;
}

class BlogListItem extends StatefulWidget {
  Blog blog;
  BlogListItem(this.blog);

  @override
  State<BlogListItem> createState() => _BlogListItemState();
}

class _BlogListItemState extends State<BlogListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsPage(id: widget.blog.id!),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        margin: EdgeInsets.only(left: 15),
        height: 420,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: widget.blog.image_id!,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, top: 10, right: 5),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      '${widget.blog.cat_name!.toUpperCase()}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: titleBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    ' • ',
                    style: TextStyle(
                      color: grey,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    getDateFormat(widget.blog.created_at!),
                    style: TextStyle(
                      color: primary,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, bottom: 15),
              child: Text(
                '${widget.blog.title!}',
                maxLines: 2,
                style: TextStyle(
                  color: titleBlack,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, bottom: 15),
              child: Text(
                '${widget.blog.content!}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, bottom: 5),
              child: Text(
                'Lire Plus',
                style: TextStyle(
                  shadows: [Shadow(color: titleBlack, offset: Offset(0, -5))],
                  color: Colors.transparent,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue.shade700,
                  decorationThickness: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogPageItems extends StatefulWidget {
  Blog blog;
  BlogPageItems({Key? key, required this.blog}) : super(key: key);

  @override
  State<BlogPageItems> createState() => _BlogPageItemsState();
}

class _BlogPageItemsState extends State<BlogPageItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsPage(id: widget.blog.id!),
          ),
        );
      },
      child: Container(
          width: MediaQuery.of(context).size.width - 30,
          height: 450,
          margin: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.blog.image_id!,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
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
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(15))),
                      child: Center(
                        child: Text(
                          '${widget.blog.cat_name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5),
                child: Text(
                  '${widget.blog.title}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: titleBlack),
                ),
              ),
              Row(
                children: [
                  Container(
                      width: 30,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Image.asset(
                        "assets/idwey.png",
                        fit: BoxFit.fill,
                      )),
                  Text(
                    'Par Idwey'.toUpperCase(),
                    style: TextStyle(
                        color: grey, fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: primaryGrey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Text(
                    getDateFormat(widget.blog.created_at!),
                    style: TextStyle(
                        color: grey, fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5),
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  '${widget.blog.content?.trimLeft()}',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primary),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, bottom: 15, top: 5),
                child: Text(
                  'Lire Plus'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: primaryOrange),
                ),
              ),
            ],
          )),
    );
  }
}
