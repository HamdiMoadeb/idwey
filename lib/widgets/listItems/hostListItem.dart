import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/host.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class HostListItem extends StatefulWidget {
  Host host;
  HostListItem(this.host);

  @override
  State<HostListItem> createState() => _HostListItemState();
}

class _HostListItemState extends State<HostListItem> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 400,
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
                    widget.host.IMAGE_URL!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              widget.host.is_featured == 1
                  ? Positioned(
                      left: 0,
                      top: 20,
                      child: Container(
                        width: 80,
                        height: 26,
                        padding: const EdgeInsets.only(left: 8, top: 5),
                        decoration: BoxDecoration(
                          color: primaryOrange,
                        ),
                        child: Text(
                          'En Vedette',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
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
                    'Ferme écologique',
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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        liked = !liked;
                      });
                    },
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: liked ? likedRed : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 15),
            child: Text(
              widget.host.title!,
              style: TextStyle(
                color: titleBlack,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
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
                  widget.host.address!,
                  style: TextStyle(
                    color: grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
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
                        '${widget.host.perp_max_persons!}',
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
                        FontAwesomeIcons.mapLocationDot,
                        size: 14,
                        color: grey,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        widget.host.location.title!,
                        style: TextStyle(
                          color: primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                widget.host.impactsocial! == "1"
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
                  '${removeDecimalZeroFormat(widget.host.price!)} DT',
                  style: TextStyle(
                    color: titleBlack,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.host.roomsList[0].number! == -1
                      ? ' /personne'
                      : ' /nuit',
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
