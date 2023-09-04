import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/image_banner/image_banner_bloc/image_banner_bloc.dart';
import 'package:idwey/data/models/host_details_dto.dart';

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

class _ImageBannerState extends State<ImageBanner>
    with TickerProviderStateMixin {
  PageController pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ImageBannerBloc>(context)
        .add(ImageBannerEvent.setListImages(widget.listImages));

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 5) {
        setState(() {
          _currentPage++;
        });
      } else {
        setState(() {
          _currentPage = 0;
        });
      }

      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBannerBloc, ImageBannerState>(
        builder: (context, state) {
      return Stack(
        children: [
          SizedBox(
            height: 316.h, // Adjust the height as needed
            child: PageView.builder(
              controller: pageController,
              allowImplicitScrolling: true,
              itemCount:
                  state.listImages!.length > 6 ? 6 : state.listImages!.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
              dotsCount: 6,
              position: _currentPage,
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

class ImageBannerSingle extends StatelessWidget {
  final String urlImage;
  const ImageBannerSingle({Key? key, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 316.h, // Adjust the height as needed
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageUrl: urlImage,
          fit: BoxFit.cover,
        ));
  }
}
