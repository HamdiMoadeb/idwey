import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/constants/enums.dart';

class CommoditiesSection extends StatelessWidget {
  final TypeReservation typeReservation;
  final List<String> listCommodities;
  const CommoditiesSection({
    Key? key,
    required this.typeReservation,
    required this.listCommodities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listCommodities.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: buildListCommodities(listCommodities, context))
        : const SizedBox.shrink();
  }

  Widget buildListCommodities(List<String> list, BuildContext context) {
    List<Widget> listWidget = [];
    for (var element in list) {
      if (element.toUpperCase() == "Douche".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: SvgPicture.asset(Assets.shower)),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Parking gratuit".toUpperCase() ||
          element.toUpperCase() == "Parking".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: SvgPicture.asset(Assets.parking)),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Cuisine équipé".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: SvgPicture.asset(Assets.kitchen)),
              SizedBox(
                width: 15.w,
              ),
              Text(
                'Cuisine équipée',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Petit déjeuner".toUpperCase() ||
          element.toUpperCase() == "Dîner".toUpperCase() ||
          element.toUpperCase() == "Déjeuner".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: SvgPicture.asset(
                  Assets.food,
                  height: 16.h,
                  width: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Internet".toUpperCase() ||
          element.toUpperCase() == "Wifi".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.wifi,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Jeux".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: SvgPicture.asset(
                  Assets.videoGames,
                  height: 16.h,
                  width: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Piscine".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.pool,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Climatisation".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Chauffage".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.fireplace,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() ==
          "Convient aux familles avec enfants".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.child_friendly,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Équipements de base".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Télévision".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.tv,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Animaux acceptés".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.pets,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() ==
          "Accès plage ou bord de mer".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.beach_access,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Logement fumeur".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.smoke_free,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() ==
          "Accessible aux personnes à mobilité réduite".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.accessible_forward_outlined,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                element ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Visites à pied".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(
                  Icons.directions_walk_outlined,
                  color: Colors.black,
                  size: 16.h,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Guide".toUpperCase() ||
          element.toUpperCase() == "Guide ou accompagnateur".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child:
                    Icon(Icons.person_outline, color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Jeux".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: const Icon(Icons.sports_esports_outlined,
                    color: Colors.black),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() ==
          "Headlamp if necessary (recommended)".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(Icons.lightbulb_outline,
                    color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      }

      /// Réservé aux adultes, Transport
      else if (element.toUpperCase() == "Réservé aux adultes".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child:
                    Icon(Icons.people_outline, color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Transport".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(Icons.directions_car_outlined,
                    color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element == "Tir à L'arc") {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(Icons.arrow_forward_outlined,
                    color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element == "Tir à L'arc") {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(Icons.arrow_forward_outlined,
                    color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element == "Tir à L'arc") {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(Icons.sports, color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == 'Toilette' ||
          element.toUpperCase() == 'Toilettes'.toUpperCase() ||
          element.toUpperCase() == 'WC'.toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(Icons.wc_outlined, color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element == "Matériels d'activité") {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(Icons.sports, color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      } else if (element.toUpperCase() == "Abris".toUpperCase()) {
        listWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: Icon(Icons.festival, color: Colors.black, size: 16.h),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  element ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        );
        listWidget.add(SizedBox(
          height: 6.h,
        ));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listWidget + [const Divider()],
    );
  }
}
