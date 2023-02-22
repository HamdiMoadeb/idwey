import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/blog.dart';
import '../../utils/colors.dart';

class BlogListItem extends StatefulWidget {
  Blog blog;
  BlogListItem(this.blog);

  @override
  State<BlogListItem> createState() => _BlogListItemState();
}

class _BlogListItemState extends State<BlogListItem> {
  getDateFormat(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(date);
    String newDate = DateFormat('dd/MM/yyyy').format(tempDate);
    return newDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
