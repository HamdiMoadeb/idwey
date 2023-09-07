import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/image_banner/image_banner.dart';
import 'package:idwey/theme/app_colors.dart';

class CustomSliverAppBar extends StatefulWidget {
  final Widget bannerWidget;

  const CustomSliverAppBar({Key? key, required this.bannerWidget})
      : super(key: key);

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  bool show = false;
  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 60.h,
      pinned: true,
      automaticallyImplyLeading: false,
      floating: true,
      backgroundColor: Colors.transparent,
      actions: [
        // Container(
        //   height: 40.h,
        //   width: 40.h,
        //   margin: const EdgeInsets.all(8),
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: materialPrimary.withOpacity(0.8),
        //   ),
        //   child: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(
        //       Icons.share_outlined,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        Container(
          height: 40.h,
          width: 40.h,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: materialPrimary.withOpacity(0.8),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              onPressed = !onPressed;
            },
            icon: Icon(
              onPressed == true ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        )
      ],
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: materialPrimary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(50)),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      elevation: 0,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (constraints.biggest.height < 100.h) {
            setState(() {
              show = true;
            });
          } else {
            setState(() {
              show = false;
            });
          }
        });
        return !show
            ? widget.bannerWidget
            : Container(
                color: Colors.grey[200],
              );
      }),
      expandedHeight: 300.h,
    );
  }
}
