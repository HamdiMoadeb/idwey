import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/host.dart';
import 'detailsWidgets.dart';

class ImageBanner extends StatefulWidget {
  String banner_image_url;
  bool isLiked;
  Function() callBack;
  String title;
  String text;
  String linkUrl;
  ImageBanner(
      {Key? key,
      required this.banner_image_url,
      required this.isLiked,
      required this.title,
      required this.text,
      required this.linkUrl,
      required this.callBack})
      : super(key: key);

  @override
  State<ImageBanner> createState() => _ImageBannerState();
}

class _ImageBannerState extends State<ImageBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 230,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: widget.banner_image_url,
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
        Positioned(
          right: 20.0,
          top: 20.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropDownSocialButton(
                  appearanceColor: false,
                  title: widget.title,
                  text: widget.text,
                  linkUrl: widget.linkUrl),
              SizedBox(
                width: 10,
              ),
              AnimatedHeartButton(
                  appearanceColor: false,
                  funCallback: () {
                    setState(() {
                      widget.isLiked = !widget.isLiked;
                      widget.callBack();
                    });
                  },
                  isLiked: widget.isLiked),
            ],
          ),
        )
      ],
    );
  }
}

class ImageGallery extends StatefulWidget {
  String currentImage;
  bool isLiked;
  List<Images> gallery_images_url;
  String title;
  String text;
  String linkUrl;
  Function() callBack;
  ImageGallery(
      {Key? key,
      required this.currentImage,
      required this.isLiked,
      required this.gallery_images_url,
      required this.title,
      required this.text,
      required this.linkUrl,
      required this.callBack})
      : super(key: key);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 300,
              width: double.maxFinite,
              child: CachedNetworkImage(
                imageUrl: widget.currentImage,
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
            Positioned(
              right: 20.0,
              top: 20.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropDownSocialButton(
                      appearanceColor: true,
                      title: widget.title,
                      text: widget.text,
                      linkUrl: widget.linkUrl),
                  SizedBox(
                    width: 10,
                  ),
                  AnimatedHeartButton(
                      appearanceColor: true,
                      funCallback: () {
                        setState(() {
                          widget.callBack();
                          widget.isLiked = !widget.isLiked;
                        });
                      },
                      isLiked: widget.isLiked),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        widget.gallery_images_url.length != 0
            ? CarouselSlider.builder(
                itemCount: widget.gallery_images_url.length,
                options: CarouselOptions(
                  height: 100,
                  viewportFraction: 0.3,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      widget.currentImage =
                          widget.gallery_images_url[index].large;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, _) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.currentImage =
                            widget.gallery_images_url[index].large;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: widget.currentImage ==
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
                          imageUrl: widget.gallery_images_url[index].thumb,
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
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container(),
      ],
    );
  }
}
