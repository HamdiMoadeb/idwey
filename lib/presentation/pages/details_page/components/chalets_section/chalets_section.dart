import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/components/verify_disponibility_bottom_sheet_content/bottom_sheet.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/presentation/blocs/details_host_bloc/details_page_bloc.dart';

class ChaletsSection extends StatelessWidget {
  final DetailsPageState state;

  const ChaletsSection({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return state.hostDetails!.rooms!.isNotEmpty &&
            state.hostDetails!.rooms!.length >= 2
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 16.h,
                ),
                child: Text(
                  'Chalets disponibles ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),

              /// build list of rooms
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: const EdgeInsets.all(8),
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
                                    imageUrl: state.hostDetails?.rooms?[index]
                                            .gallery ??
                                        "")),
                          ),

                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.hostDetails?.rooms?[index].title ??
                                        "",
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
                                        " • X${state.hostDetails?.rooms?[index].adults ?? ""}",
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
                                        " • X${state.hostDetails?.rooms?[index].adults ?? ""}",
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
                                        " • X${double.parse(state.hostDetails?.row?.price ?? "0").toInt().toString()} DT / nuit",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                  itemCount: state.hostDetails!.rooms!.length > 1
                      ? 2
                      : state.hostDetails!.rooms!.length),

              state.hostDetails!.rooms!.isNotEmpty &&
                      state.hostDetails!.rooms!.length > 2
                  ? Padding(
                      padding: EdgeInsets.only(top: 14.h),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        child: ChaletRoomsBottomSheet(
                                            state: state));
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 16.w),
                                  child: Text(
                                    'Voir plus des chalets',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Divider(
                      thickness: 1,
                    ),
            ],
          )
        : const SizedBox.shrink();
  }
}
