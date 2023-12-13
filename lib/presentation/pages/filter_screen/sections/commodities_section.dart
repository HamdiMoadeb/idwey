import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/extra_price_component/extra_price_component.dart';
import 'package:idwey/presentation/pages/filter_screen/sections/components/filter_component_commodities.dart';

class CommoditiesFilterSection extends StatefulWidget {
  final List<String> extraPrices;
  final String title;

  CommoditiesFilterSection(
      {Key? key, required this.extraPrices, required this.title})
      : super(key: key);

  @override
  State<CommoditiesFilterSection> createState() =>
      _CommoditiesFilterSectionState();
}

class _CommoditiesFilterSectionState extends State<CommoditiesFilterSection> {
  List<bool> isCheckedList = [];
  bool showMore = false;

  @override
  void initState() {
    // TODO: implement initState
    isCheckedList = List.generate(widget.extraPrices.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final e = widget.extraPrices[index];
              return CommodityFilterComponent(
                isChecked:
                    isCheckedList[index], // Use the individual checked state
                title: e ?? "",
                onCheck: (bool? v) {
                  setState(() {
                    isCheckedList[index] =
                        v ?? false; // Update the individual checked state
                  });

                  /// if checked == true add the extra price to the list else remove it
                  if (v == true) {
                    print("checked");
                  } else {
                    print("unchecked");
                  }
                },
              );
            },
            itemCount: widget.extraPrices.length > 3
                ? showMore
                    ? widget.extraPrices.length
                    : 3
                : widget.extraPrices.length,
            shrinkWrap: true,
          ),

          /// show more button underline
          if (widget.extraPrices.length > 3)
            TextButton(
              onPressed: () {
                /// show more
                setState(() {
                  showMore = !showMore;
                });
              },
              child: Row(
                children: [
                  Text(
                    "Plus",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 20.sp,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          SizedBox(
            height: 8.h,
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
