import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PayementSection extends StatefulWidget {
  bool? offline;
  bool? online;
  final Function(String)? onOfflineChecked;
  final Function(String)? onOnlineChecked;
  PayementSection({
    Key? key,
    this.offline,
    this.online,
    required this.onOfflineChecked,
    this.onOnlineChecked,
  }) : super(key: key);

  @override
  State<PayementSection> createState() => _PayementSectionState();
}

class _PayementSectionState extends State<PayementSection> {
  String radioItem = '';
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 16.h, right: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 16.h),
            child: Text(
              "Choisir comment payer",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const Divider(
              thickness: 1,
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: const HeroIcon(
                  HeroIcons.banknotes,
                  color: Colors.black,
                ),
                title: Text(
                  'Offline',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.h,
                  ),
                ),
                trailing: Radio<String>(
                  value: "Offline",
                  groupValue: radioItem,
                  onChanged: (String? value) {
                    widget.onOfflineChecked!(value!);
                    setState(() {
                      radioItem = value ?? "";
                      widget.offline = true;
                    });
                  },
                ),
              ),
              // ListTile(
              //   leading: const HeroIcon(
              //     HeroIcons.creditCard,
              //     color: Colors.black,
              //   ),
              //   title: Text(
              //     'Online',
              //     style: TextStyle(
              //       fontWeight: FontWeight.w500,
              //       fontSize: 16.h,
              //     ),
              //   ),
              //   trailing: Radio<String>(
              //     value: "Online",
              //     groupValue: radioItem,
              //     onChanged: (String? value) {
              //       widget.onOnlineChecked!(value!);
              //       setState(() {
              //         radioItem = value ?? "";
              //         widget.online = true;
              //       });
              //     },
              //   ),
              // ),
              Visibility(
                visible: widget.offline == true,
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 16.h, left: 16.h, right: 16.h),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "- Des frais bancaires de ",
                          style: TextStyle(
                            fontSize: 16.h,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '1,6 %',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.h,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "seront prélevés sur les paiements en ligne pour carte nationales.",
                              style: TextStyle(
                                fontSize: 16.h,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                        textHeightBehavior: TextHeightBehavior(),
                      ),
                      SizedBox(height: 16.h),
                      RichText(
                        text: TextSpan(
                          text: "- Des frais bancaires de ",
                          style: TextStyle(
                            fontSize: 16.h,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '3,1 %',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.h,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "seront prélevés sur les paiements en ligne pour carte internationales.",
                              style: TextStyle(
                                fontSize: 16.h,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                        textHeightBehavior: TextHeightBehavior(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
