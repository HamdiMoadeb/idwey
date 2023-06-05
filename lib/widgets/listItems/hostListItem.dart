import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/utils/enums.dart';

import '../../models/host.dart';
import '../../screens/detailsPages/hostDetailsPage.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class HostListItem extends StatefulWidget {
  Host host;
  bool fromHomepage;
  int? currencyValue;
  String currency;
  HostListItem(this.host, this.fromHomepage, this.currencyValue, this.currency);

  @override
  State<HostListItem> createState() => _HostListItemState();
}

class _HostListItemState extends State<HostListItem> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HostDetailsPage(
              id: widget.host.id,
              typeHost: widget.host.typeHost == "Par Chalet "
                  ? TypeHost.parChalet
                  : widget.host.typeHost == "Par Personne"
                      ? TypeHost.parPersonne
                      : TypeHost.maisonEntiere,
            ),
          ),
        )
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 430,
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
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.host.IMAGE_URL!,
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
                widget.host.is_featured == 1
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
                      widget.host.term_name!,
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
                  widget.host.max_person! > 0
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
                                '${widget.host.max_person!}',
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
                          FontAwesomeIcons.mapLocationDot,
                          size: 14,
                          color: grey,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          widget.host.location_name!,
                          style: TextStyle(
                            color: primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.host.per_person!.isNotEmpty
                      ? Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidBookmark,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                widget.host.typeHost ?? '',
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
                  widget.host.impactsocial! == "Oui"
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
                  widget.host.has_room == 1
                      ? Text(
                          'de  ',
                          style: TextStyle(
                            color: grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : Container(),
                  FaIcon(
                    FontAwesomeIcons.bolt,
                    size: 14,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${removeDecimalZeroFormat(widget.currency != 'DT' ? currencyConverteur(widget.currencyValue!, widget.host.price!) : widget.host.price!)} ${widget.currency}',
                    style: TextStyle(
                      color: titleBlack,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.host.per_person! == "personne"
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
                children: [
                  Text(
                    widget.fromHomepage
                        ? 'Votre réservation = '
                        : 'Réserver Maintenant = ',
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
