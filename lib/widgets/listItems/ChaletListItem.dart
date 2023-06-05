import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/widgets/common/ImageCommon.dart';
import 'package:idwey/widgets/common/dialog_image_slider.dart';

import '../../models/host.dart';
import '../../models/room.dart';
import '../../screens/detailsPages/hostDetailsPage.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../common/full_screen_image.dart';

class ChaletListItem extends StatefulWidget {
  Room? room;
  bool fromHomepage;
  int? currencyValue;
  String currency;
  ChaletListItem(
      this.room, this.fromHomepage, this.currencyValue, this.currency);

  @override
  State<ChaletListItem> createState() => _ChaletListItemState();
}

class _ChaletListItemState extends State<ChaletListItem> {
  bool liked = false;
  String currentImage = '';
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        widget.room?.gallery?.length != 0
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    child: AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.room?.title ?? "",
                            style: TextStyle(color: primary),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: FaIcon(FontAwesomeIcons.xmark,
                                  color: grey, size: 20)),
                        ],
                      ),
                      content: SizedBox(
                        height: 420,
                        width: 500,
                        child: ImageSlider(
                          title: widget.room?.title ?? "",
                          text: "Partager maintenant",
                          gallery_images_url: widget.room?.gallery ?? [],
                          callBack: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FullScreenImage(room: widget.room)));
                          },
                        ),
                      ),
                    ),
                  );
                },
              )
            : null,
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        // height: 430,
        margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
        padding: EdgeInsets.only(bottom: 16),
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
                      imageUrl: widget.room?.imageId ?? "",
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
                  right: 0,
                  child: Container(
                    height: 28,
                    padding: const EdgeInsets.only(left: 8, top: 5, right: 8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(10),
                      ),
                      color: grey,
                    ),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.cameraRetro,
                          size: 14,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.room?.gallery?.length.toString() ?? "0",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 15),
              child: Text(
                widget.room?.title ?? "",
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
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.bed,
                          size: 16,
                          color: grey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          ".x ${widget.room?.beds.toString() ?? ""}",
                          style: TextStyle(
                            color: grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.peopleGroup,
                          size: 16,
                          color: grey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          ".x ${widget.room?.adults?.toString() ?? ""}",
                          style: TextStyle(
                            color: grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.room != null
                      ? Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.moneyBill,
                                size: 16,
                                color: grey,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${removeDecimalZeroFormat(widget.currency != 'DT' ? currencyConverteur(widget.currencyValue!, widget.room?.price ?? "") : widget.room?.price ?? "")} ${widget.currency} /night',
                                style: TextStyle(
                                  color: grey,
                                  fontSize: 15,
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
          ],
        ),
      ),
    );
  }
}
