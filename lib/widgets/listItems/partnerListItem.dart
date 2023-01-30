import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PartnerListItem extends StatefulWidget {
  String imageurl;
  PartnerListItem(this.imageurl);

  @override
  State<PartnerListItem> createState() => _PartnerListItemState();
}

class _PartnerListItemState extends State<PartnerListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      margin: EdgeInsets.only(left: 15),
      height: 150,
      child: Center(
        child: CachedNetworkImage(
          imageUrl: widget.imageurl,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
