import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/verify_disponibility_bottom_sheet_content/bottom_sheet.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class HeaderWidget extends StatefulWidget {
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
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  PickedFile _pickedFile = PickedFile("");
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
              EditableCircleAvatar(
                  imageUrl: widget.imageUrl == ""
                      ? "https://placehold.co/600x400/png"
                      : widget.imageUrl,
                  image: _pickedFile.path,
                  onEditPressed: () {
                    requestPermissions();
                  }),
              SizedBox(
                height: 16.h,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.subtitle,
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

  Future<void> requestPermissions() async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      print("granted");
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ChooseImageSourceBottomSheet(
                onCameraPressed: () {
                  _pickImage(ImageSource.camera);
                },
                onGalleryPressed: () {
                  _pickImage(ImageSource.gallery);
                },
              ));
        },
      );
    } else if (status.isDenied) {
      print("denied");
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      print(pickedFile.path);

      Map<String, dynamic> map = {
        'file': await MultipartFile.fromFile(pickedFile.path)
      };

      /// Upload image
      /// set image into avatar widget
      _pickedFile = pickedFile;
      context.read<AppBloc>().add(
            AppEvent.uploadImage(map),
          );
    }
  }
}

class EditableCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final String? image;
  final Function()? onEditPressed;

  const EditableCircleAvatar({
    Key? key,
    required this.imageUrl,
    this.onEditPressed,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("imageUrl444444444");
    print(imageUrl);
    return Stack(
      children: [
        CircleAvatar(
          radius: 52,
          child: CircleAvatar(
            radius: 50.0, // Adjust the size as needed
            backgroundImage: imageUrl == ""
                ? FileImage(File(image ?? ""))
                : NetworkImage(imageUrl) as ImageProvider,
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
