import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/theme/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  const HeaderWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              EditableCircleAvatar(imageUrl: imageUrl),
              SizedBox(
                height: 16.h,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditableCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final Function()? onEditPressed;

  const EditableCircleAvatar({
    Key? key,
    required this.imageUrl,
    this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 52,
          child: CircleAvatar(
            radius: 50.0, // Adjust the size as needed
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: onEditPressed,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: primaryOrange,
                    width: 2,
                  ),
                ),
              ),
              child: Icon(
                Icons.edit,
                color: primaryOrange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
