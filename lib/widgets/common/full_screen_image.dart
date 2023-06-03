import 'package:flutter/material.dart';
import 'package:idwey/models/room.dart';
import 'package:idwey/widgets/common/dialog_image_slider.dart';

class FullScreenImage extends StatefulWidget {
  Room? room;
  FullScreenImage({Key? key, required this.room}) : super(key: key);

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageSlider(
            fullScreen: true,
            title: widget.room?.title ?? "",
            text: "Partager maintenant",
            gallery_images_url: widget.room?.gallery ?? [],
            callBack: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
