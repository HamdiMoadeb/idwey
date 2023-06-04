import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/widgets/common/full_screen_image.dart';

import '../../models/imageGallery.dart';
import 'detailsWidgets.dart';

class ImageSlider extends StatefulWidget {
  List<Images> gallery_images_url;
  String title;
  String text;
  bool fullScreen;
  Function() callBack;
  ImageSlider(
      {Key? key,
      required this.gallery_images_url,
      required this.title,
      required this.text,
      this.fullScreen = false,
      required this.callBack})
      : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  String? currentImage = "";
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getCurrentImage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        currentImage != null && currentImage != ""
            ? Stack(
                children: [
                  SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        imageUrl: currentImage ?? "",
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
                      )),
                  Positioned(
                      child: InkWell(
                        onTap: () {
                          widget.callBack();
                        },
                        child: widget.fullScreen
                            ? const FaIcon(
                                FontAwesomeIcons.downLeftAndUpRightToCenter,
                                size: 20,
                                color: Colors.white)
                            : const FaIcon(
                                FontAwesomeIcons.upRightAndDownLeftFromCenter,
                                size: 20,
                                color: Colors.white),
                      ),
                      top: 10,
                      right: 10)
                ],
              )
            : SizedBox.shrink(),
        const SizedBox(
          height: 20,
        ),
        widget.gallery_images_url.length != 0
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.gallery_images_url.length,
                  itemBuilder: (BuildContext context, int index) {
                    return widget.gallery_images_url[index].thumb != null &&
                            widget.gallery_images_url[index].thumb != ""
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                currentImage =
                                    widget.gallery_images_url[index].large;
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: currentImage ==
                                          widget.gallery_images_url[index].large
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        widget.gallery_images_url[index].thumb,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )),
                            ),
                          )
                        : Container();
                  },
                ),
              )
            : Container(),
      ],
    );
  }

  String getCurrentImage() {
    currentImage = widget.gallery_images_url[0].large;
    int i = 1;
    if (widget.gallery_images_url[i].large != null &&
        widget.gallery_images_url[i].thumb != "") {
      currentImage = widget.gallery_images_url[i].large;
    } else {
      i++;
    }

    return currentImage ?? "";
  }
}
