import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idwey/models/destination.dart';

import '../../utils/colors.dart';

class DestinationListItem extends StatefulWidget {
  Destination destination;
  DestinationListItem(this.destination);

  @override
  State<DestinationListItem> createState() => _DestinationListItemState();
}

class _DestinationListItemState extends State<DestinationListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      margin: EdgeInsets.only(left: 15),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: CachedNetworkImage(
                imageUrl: widget.destination.image_id!,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
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
          Positioned(
            top: 100,
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      widget.destination.name!.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 15, left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: primaryOrange,
                    ),
                    child: Column(
                      children: [
                        widget.destination.nb_events != 0
                            ? Text(
                                '${widget.destination.nb_events} événements',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : Container(width: 0),
                        widget.destination.nb_hotels != 0
                            ? Text(
                                '${widget.destination.nb_hotels} hébergements',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : Container(width: 0),
                        widget.destination.nb_activities != 0
                            ? Text(
                                '${widget.destination.nb_activities} activités',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : Container(width: 0),
                        widget.destination.nb_experiences != 0
                            ? Text(
                                '${widget.destination.nb_experiences} expériences',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : Container(width: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
