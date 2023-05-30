import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/screens/detailsPages/eventDetailsPage.dart';
import 'package:intl/intl.dart';

import '../../models/event.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class EventListItem extends StatefulWidget {
  Event event;
  int? currencyValue;
  String currency;
  EventListItem(this.event, this.currencyValue, this.currency);

  @override
  State<EventListItem> createState() => _EventListItemState();
}

class _EventListItemState extends State<EventListItem> {
  getDateFormat(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(date);
    String newDate = DateFormat('dd-MM-yyyy').format(tempDate);
    return newDate;
  }

  String addSpaceAfterComma(String str) {
    return str.replaceAll(',', ', ');
  }

  Widget buildBottomButton() {
    return widget.event.isExpired == 1
        ? BottomButton(
            text: '',
            color: Colors.grey,
          )
        : BottomButton(
            text: 'Book Now',
            color: primaryOrange,
          );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetailsPage(id: widget.event.id),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 460,
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
                    child: CachedNetworkImage(
                      imageUrl: widget.event.IMAGE_URL!,
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
                  bottom: 0,
                  child: Container(
                    height: 28,
                    padding: const EdgeInsets.only(left: 8, top: 5, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                      color: widget.event.isFull == 1
                          ? redColorWithOpacity
                          : widget.event.isExpired == 1
                              ? disabledColorWithOpacity
                              : primaryOrange,
                    ),
                    child: Text(
                      widget.event.terms_name!.length < 30
                          ? addSpaceAfterComma(widget.event.terms_name!)
                          : '${addSpaceAfterComma(widget.event.terms_name!.substring(0, 30))}...',
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
                    margin: EdgeInsets.only(left: 10, top: 8, right: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidPaperPlane,
                          size: 11,
                          color: grey,
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: Text(
                            widget.event.address!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
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
                  widget.event.number! > 0
                      ? Container(
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
                        )
                      : Container(),
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
                    '${removeDecimalZeroFormat(widget.currency != 'DT' ? currencyConverteur(widget.currencyValue!, widget.event.price!) : widget.event.price!)} ${widget.currency}',
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
            widget.event.isFull == 1
                ? BottomButton(
                    text: 'évenement complet',
                    color: redColor,
                  )
                : widget.event.isExpired == 1
                    ? BottomButton(
                        text: 'évenement expiré',
                        color: disabledColor,
                      )
                    : BottomButton(
                        text: 'votre réservation',
                        color: primaryOrange,
                      ),
          ],
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  String? text;

  Color? color;

  BottomButton({Key? key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        color: color ?? primaryOrange,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? '',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          color == primaryOrange
              ? FaIcon(
                  FontAwesomeIcons.tree,
                  size: 15,
                  color: Colors.green,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
