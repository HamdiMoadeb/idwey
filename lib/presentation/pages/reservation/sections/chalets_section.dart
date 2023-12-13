import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idwey/data/models/room_dto.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';

import '../../../../constants/assets.dart';

class ChaletsSectionDisponibility extends StatefulWidget {
  final List<Room> rooms;
  final String? price;
  const ChaletsSectionDisponibility({Key? key, required this.rooms, this.price})
      : super(key: key);

  @override
  State<ChaletsSectionDisponibility> createState() =>
      _ChaletsSectionDisponibilityState();
}

class _ChaletsSectionDisponibilityState
    extends State<ChaletsSectionDisponibility> {
  List<bool> selectedList = []; // List to track checked state of each checkbox

  @override
  void initState() {
    // TODO: implement initState
    selectedList = List.generate(widget.rooms.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
          child: Row(
            children: [
              SvgPicture.asset(Assets.tinyHome),
              SizedBox(width: 10.w),
              const Text('Chalets disponibles ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ],
          ),
        ),
        const Divider(),

        /// build list of rooms
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedList[index] = !selectedList[index];
                  });
                  if (selectedList[index] == true) {
                    context.read<ReservationBloc>().add(
                        ReservationEvent.onSelectChalet(widget.rooms[index]));
                  } else {
                    context.read<ReservationBloc>().add(
                        ReservationEvent.onUnSelectChalet(widget.rooms[index]));
                  }
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: selectedList[index] == true
                          ? const BorderSide(
                              color: Colors.red,
                              width: 1,
                            )
                          : const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        SizedBox(
                          width: 124.w,
                          height: 106.w,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: CachedNetworkImage(
                                  placeholder: (context, url) => Image.asset(
                                        Assets.placeholder,
                                        fit: BoxFit.cover,
                                      ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                        Assets.placeholder,
                                        fit: BoxFit.cover,
                                      ),
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      widget.rooms?[index].imageId ?? "")),
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.rooms?[index].title ?? "",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.bed,
                                        height: 20.w, width: 20.w),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      " • X${widget.rooms?[index].adults ?? ""}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      Assets.userGroup,
                                      height: 20.w,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      " • X${widget.rooms?[index].adults ?? ""}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      Assets.moneySack,
                                      height: 20.w,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      " • X${double.parse(widget.price ?? "0").toInt().toString()} DT / nuit",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
            itemCount: widget.rooms!.length),
      ],
    );
  }
}
