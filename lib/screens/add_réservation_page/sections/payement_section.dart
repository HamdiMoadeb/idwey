import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/utils/urls.dart';
import 'package:url_launcher/url_launcher.dart';

class PayementSection extends StatefulWidget {
  bool? Checked;
  bool? offline;
  final Function(bool)? onTermsChecked;
  final Function(String)? onOfflineChecked;
  PayementSection({
    Key? key,
    this.Checked,
    this.offline,
    required this.onTermsChecked,
    required this.onOfflineChecked,
  }) : super(key: key);

  @override
  State<PayementSection> createState() => _PayementSectionState();
}

class _PayementSectionState extends State<PayementSection> {
  String radioItem = '';
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 16.h),
          child: Text(
            "Méthode de paiement",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
          ),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: Colors.grey[300]!, width: 1),
          ),
          padding: EdgeInsets.only(
            right: 16.h,
            left: 16.h,
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Offline',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: materialPrimary,
                    fontSize: 16.h,
                  ),
                ),
                leading: Radio<String>(
                  value: "Offline",
                  groupValue: radioItem,
                  onChanged: (String? value) {
                    widget.onOfflineChecked!(value!);
                    setState(() {
                      radioItem = value;
                      widget.offline = true;
                    });
                  },
                ),
              ),
              Visibility(
                visible: radioItem == "Offline",
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: RichText(
                    text: TextSpan(
                      text:
                          'Pour confirmer votre réservation, veuillez effectuer votre paiement dans un délai de',
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: grey,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' 48 heures.\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.h,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text:
                              '''\nAuprès de notre bureau :Avenue Habib Bourguiba,\n\nImmeuble Le Parnasse 7eme étage.\n\nPour plus d'information contacter : 52394676 \n\nPremier arrivé premier servi''',
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w500,
                            color: grey,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                    textHeightBehavior: TextHeightBehavior(),
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (bool? value) {
                widget.onTermsChecked!(value!);
                setState(() {
                  isChecked = value;
                  widget.Checked = isChecked;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: RichText(
                text: TextSpan(
                  text: 'J\'ai lu et j\'accepte les ',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: materialPrimary,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Termes et conditions.\n',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          final Uri uri = Uri.parse(Urls.TERMS_URL);
                          launchUrl(uri);
                        },
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 13.sp,
                        color: primaryOrange,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
                textHeightBehavior: TextHeightBehavior(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
