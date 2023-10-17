import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/theme/app_colors.dart';

/// custom header for product page
///
class CustomHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function(int i) onchange;
  const CustomHeader(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onchange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          CustomCounter(
            initialValue: 1,
            onChanged: onchange ??
                (i) {
                  print(i);
                },
          ),
        ],
      ),
    );
  }
}

class CustomCounter extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onChanged;

  const CustomCounter({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomCounterState createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200]!,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (_counter > 1) {
                setState(() {
                  _counter--;
                  widget.onChanged(_counter);
                });
              }
            },
          ),
          Text(
            '$_counter',
            style: const TextStyle(fontSize: 16.0),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                _counter++;
                widget.onChanged(_counter);
              });
            },
          ),
        ],
      ),
    );
  }
}
