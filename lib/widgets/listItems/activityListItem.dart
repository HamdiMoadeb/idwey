import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/models/activity.dart';
import 'package:idwey/screens/detailsPages/activityDetailsPage.dart';

import '../../utils/colors.dart';
import '../../utils/utils.dart';

class ActivityListItem extends StatefulWidget {
  Activity activity;
  int? currencyValue;
  String currency;
  ActivityListItem(this.activity, this.currencyValue, this.currency);

  @override
  State<ActivityListItem> createState() => _ActivityListItemState();
}

class _ActivityListItemState extends State<ActivityListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      margin: EdgeInsets.only(left: 15),
      height: 440,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ActivityDetailsPage(id: widget.activity.id!),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.activity.IMAGE_URL!,
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
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: 50.0,
                        color: primaryOrange,
                      ),
                    ),
                  ),
                ),
                widget.activity.is_featured == 1
                    ? Positioned(
                        left: 0,
                        top: 20,
                        child: Container(
                          height: 26,
                          padding: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: primaryOrange,
                          ),
                          child: Center(
                            child: Text(
                              'En Vedette  ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 28,
                    padding: const EdgeInsets.only(left: 8, top: 5, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                      color: primaryOrange,
                    ),
                    child: Text(
                      widget.activity.cat_name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 15),
              child: Text(
                widget.activity.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: titleBlack,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            widget.activity.address!.isNotEmpty
                ? Container(
                    margin: EdgeInsets.only(left: 10, top: 8),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidPaperPlane,
                          size: 11,
                          color: grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.activity.address!,
                          style: TextStyle(
                            color: grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.userGroup,
                          size: 14,
                          color: grey,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${widget.activity.max_people}',
                          style: TextStyle(
                            color: primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.activity.duration!.isNotEmpty
                      ? Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.clock,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '${widget.activity.duration} H',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  widget.activity.impactsocial! == "Oui"
                      ? Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.slideshare,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Impact',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 8, bottom: 10),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.bolt,
                    size: 14,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${removeDecimalZeroFormat(widget.currency != 'DT' ? currencyConverteur(widget.currencyValue!, widget.activity.price!) : widget.activity.price!)} ${widget.currency}',
                    style: TextStyle(
                      color: titleBlack,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' /personne',
                    style: TextStyle(
                      color: grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                color: primaryOrange,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Votre réservation = ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.tree,
                    size: 15,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
