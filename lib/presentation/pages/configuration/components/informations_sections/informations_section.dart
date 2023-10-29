import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfosSection extends StatefulWidget {
  final String? label;
  final Widget child;
  const InfosSection({Key? key, this.label, required this.child})
      : super(key: key);

  @override
  State<InfosSection> createState() => _InfosSectionState();
}

class _InfosSectionState extends State<InfosSection> {
  bool showForm = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          showForm = !showForm;
        });
      },
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  widget.label ?? "",
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
              Visibility(
                visible: showForm,
                child: const Divider(
                  thickness: 1,
                ),
              ),
              Visibility(visible: showForm, child: widget.child)
            ],
          )),
    );
  }
}
