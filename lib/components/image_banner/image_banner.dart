import 'package:banner_image/banner_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/image_banner/image_banner_bloc/image_banner_bloc.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/theme/app_colors.dart';

// class ImageBanner extends StatefulWidget {
//   const ImageBanner({Key? key, required this.images}) : super(key: key);
//
//   final List<Gallery> images;
//
//   @override
//   State<ImageBanner> createState() => _ImageBannerState();
// }
//
// class _ImageBannerState extends State<ImageBanner> {
//   List<String> list = [];
//   getListUrls() {
//     for (var i = 0; i < widget.images.length; i++) {
//       print("******************");
//       print(widget.images[i].thumb);
//       list.add(widget.images[i].thumb);
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     getListUrls();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BannerImage(
//       padding: EdgeInsets.zero,
//       aspectRatio: 1.5,
//       itemLength: list.length,
//       imageUrlList: list,
//       selectedIndicatorColor: materialPrimary,
//       onTap: (int index) {
//         print(index);
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text('On Tap')));
//       },
//     );
//   }
// }

// image_page.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ImageBanner extends StatefulWidget {
  final List<Gallery> listImages;
  const ImageBanner({Key? key, required this.listImages}) : super(key: key);

  @override
  State<ImageBanner> createState() => _ImageBannerState();
}

class _ImageBannerState extends State<ImageBanner> {
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ImageBannerBloc>(context)
        .add(ImageBannerEvent.setListImages(widget.listImages));

    pageController.addListener(() {
      if (pageController.page!.toInt() > 5) {
        print("pageController.page!.toInt().modInverse(6)");
        print(pageController.page!.toInt().modInverse(4));
        BlocProvider.of<ImageBannerBloc>(context).add(
            ImageBannerEvent.setCurrentImage(
                pageController.page!.toInt().modInverse(4)));
      } else {
        BlocProvider.of<ImageBannerBloc>(context).add(
            ImageBannerEvent.setCurrentImage(pageController.page!.toInt()));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBannerBloc, ImageBannerState>(
        builder: (context, state) {
      return Stack(
        children: [
          SizedBox(
            height: 300.h, // Adjust the height as needed
            child: PageView.builder(
              controller: pageController,
              itemCount: state.listImages!.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: state.listImages![index].large,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Positioned(
            bottom: 5.h,
            left: 150.w,
            child: DotsIndicator(
              dotsCount: 5,
              position: state.currentImage!.toInt(),
              decorator: const DotsDecorator(
                  color: Colors.white60, // Inactive dot color
                  activeColor: Colors.white,
                  spacing: EdgeInsets.all(2) // Active dot color
                  ),
            ),
          ),
        ],
      );
    }
        // Loading indicator
        );
  }
}
