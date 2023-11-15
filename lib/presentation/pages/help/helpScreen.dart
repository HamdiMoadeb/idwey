import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Divider(
                thickness: 1,
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Text(
                  'Besoin d’aide ?',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 28.sp),
                  textAlign: TextAlign.start,
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100.h,
                      width: 7.w,
                      decoration: BoxDecoration(
                        color: primaryOrange,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                            bottomLeft: Radius.circular(5.r)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Appelez nous'),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            '+216 31 106 666',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: primary,
                                    fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100.h,
                      width: 7.w,
                      decoration: BoxDecoration(
                        color: primaryOrange,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                            bottomLeft: Radius.circular(5.r)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Horaires'),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Lundi -> Vendredi',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: primary,
                                    ),
                          ),
                          Text(
                            '10:00 -> 18:00',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: primary,
                                    fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100.h,
                      width: 7.w,
                      decoration: BoxDecoration(
                        color: primaryOrange,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                            bottomLeft: Radius.circular(5.r)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Adresse'),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            '63 Avenue Habib Bourguiba \n(Immeuble Le Parnasse) 7ème étage. \n Tunis, Tunisie',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: primary,
                                    fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
