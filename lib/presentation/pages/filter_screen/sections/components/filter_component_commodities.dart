import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommodityFilterComponent extends StatefulWidget {
  final String title;
  final Function(bool? v)? onCheck;
  final bool? isChecked;
  const CommodityFilterComponent(
      {Key? key, required this.title, this.onCheck, this.isChecked})
      : super(key: key);

  @override
  State<CommodityFilterComponent> createState() =>
      _CommodityFilterComponentState();
}

class _CommodityFilterComponentState extends State<CommodityFilterComponent> {
  final bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  // overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16.sp, color: Colors.black),
                ),
              ),
              widget.isChecked == null
                  ? const SizedBox.shrink()
                  : Checkbox(
                      value: widget.isChecked,
                      onChanged: widget.onCheck ?? (bool? v) {}),
            ],
          ),
        ),
      ],
    );
  }
}
