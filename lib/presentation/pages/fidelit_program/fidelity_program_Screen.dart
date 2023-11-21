import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/presentation/pages/fidelit_program/sections/advanture_month_section.dart';
import 'package:idwey/presentation/pages/fidelit_program/sections/super_adventure.dart';

@RoutePage()
class FidelityProgramScreen extends StatelessWidget {
  const FidelityProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> list = [
      "Réservez et Gagner ",
      "Aventurier du mois",
      "Super Aventurier ",
    ];

    final List<String> listContent = [
      "Gagner des récompenses à chaque niveau et à chaque mois",
      "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Text(
            "Programme de Fidélité",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
            child: Divider(
              thickness: 1,
              height: 1,
            ),
            preferredSize: Size.fromHeight(16.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AdventureMonthSection(),
            const SuperAdventureSection(),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    children: [
                      Row(children: [
                        HeroIcon(
                          HeroIcons.trophy,
                          size: 24.sp,
                          color: Colors.black,
                          style: HeroIconStyle.solid,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          list[index],
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ]),
                      const SizedBox(height: 10),
                      Text(
                        listContent[index],
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
              itemCount: list.length,
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
