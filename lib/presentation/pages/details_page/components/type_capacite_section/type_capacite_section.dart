import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/constants/enums.dart';

class TypeCapaciteSection extends StatelessWidget {
  final TypeReservation typeReservation;
  final String? type;
  final String? capacite;
  final String? emplacement;
  final String? duration;
  final String? difficulty;
  final String? experience;

  const TypeCapaciteSection(
      {Key? key,
      required this.typeReservation,
      this.type,
      this.capacite,
      this.emplacement,
      this.duration,
      this.difficulty,
      this.experience})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            typeReservation == TypeReservation.host
                ? FilterItemType(
                    icon: SvgPicture.asset(
                      Assets.house,
                      height: 30.h,
                      width: 30.h,
                    ),
                    label: type ?? "",
                  )
                : const SizedBox.shrink(),
            FilterItemType(
              icon: SvgPicture.asset(
                Assets.userGroup,
                height: 30.h,
                width: 30.h,
              ),
              label: "${capacite ?? ""} personnes",
            ),
            duration == null || duration == ""
                ? const SizedBox.shrink()
                : FilterItemType(
                    icon: SvgPicture.asset(
                      Assets.watchLater,
                      height: 30.h,
                      width: 30.h,
                    ),
                    label: "${duration ?? ""} heures",
                  ),
            difficulty == null || difficulty == ""
                ? const SizedBox.shrink()
                : FilterItemType(
                    icon: SvgPicture.asset(
                      Assets.battery,
                      height: 30.h,
                      width: 30.h,
                    ),
                    label: difficulty ?? "",
                  ),
            typeReservation == TypeReservation.host
                ? emplacement == null || emplacement == ""
                    ? const SizedBox.shrink()
                    : FilterItemType(
                        icon: SvgPicture.asset(
                          Assets.beachArea,
                          height: 30.h,
                          width: 30.h,
                        ),
                        label: emplacement ?? "",
                      )
                : const SizedBox.shrink(),
            experience == null || experience == ""
                ? const SizedBox.shrink()
                : FilterItemType(
                    icon: SvgPicture.asset(
                      Assets.experience,
                      height: 30.h,
                      width: 30.h,
                    ),
                    label: experience ?? "",
                  ),
          ],
        ),
      ),
    );
  }
}
