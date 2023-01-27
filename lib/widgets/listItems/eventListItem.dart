import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../models/event.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class EventListItem extends StatefulWidget {
  Event event;
  EventListItem(this.event);

  @override
  State<EventListItem> createState() => _EventListItemState();
}

class _EventListItemState extends State<EventListItem> {
  getDateFormat(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(date);
    String newDate = DateFormat('dd-MM-yyyy').format(tempDate);
    return newDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Image.network(
                    widget.event.IMAGE_URL!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
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
                    widget.event.terms_name!,
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
              widget.event.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: titleBlack,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          widget.event.address!.isNotEmpty
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
                        widget.event.address!,
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
            margin: EdgeInsets.only(left: 10, top: 8),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.calendarDays,
                  size: 14,
                  color: primaryOrange,
                ),
                const SizedBox(width: 5),
                Text(
                  getDateFormat(widget.event.start_date!),
                  style: TextStyle(
                    color: titleBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
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
                        '${widget.event.number!}',
                        style: TextStyle(
                          color: primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.pepperHot,
                        size: 14,
                        color: grey,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        widget.event.difficulty!,
                        style: TextStyle(
                          color: primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                widget.event.impactsocial! == "Oui"
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
                widget.event.duration!.isNotEmpty
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
                              '${widget.event.duration} H',
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
            margin: EdgeInsets.only(left: 10, top: 8),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.bolt,
                  size: 14,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Text(
                  '${removeDecimalZeroFormat(widget.event.price!)} DT',
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
    );
  }
}
