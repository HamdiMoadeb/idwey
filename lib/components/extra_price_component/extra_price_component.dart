import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/presentation/pages/details_page/components/product_page_header/product_page_header.dart';

class ExtraPriceComponent extends StatefulWidget {
  final String title;
  final String subtitle;
  final Function(int i)? onchange;
  final Function(bool? v)? onCheck;
  final bool? isChecked;
  const ExtraPriceComponent(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.onchange,
      this.onCheck,
      this.isChecked})
      : super(key: key);

  @override
  State<ExtraPriceComponent> createState() => _ExtraPriceComponentState();
}

class _ExtraPriceComponentState extends State<ExtraPriceComponent> {
  final bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                widget.isChecked == null
                    ? const SizedBox.shrink()
                    : Checkbox(
                        value: widget.isChecked,
                        onChanged: widget.onCheck ?? (bool? v) {}),
                Expanded(
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16.sp, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            "${widget.subtitle} DT",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 16.w,
          ),
          CustomCounter(
            initialValue: 0,
            onChanged: widget.onchange ?? (int i) {},
          ),
        ],
      ),
    );
  }
}
