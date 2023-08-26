import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/presentation/blocs/details_host_bloc/details_page_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

class DraggableBottomSheet extends StatelessWidget {
  const DraggableBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.network(
              'https://images.unsplash.com/photo-1541532713592-79a0317b6b77?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=688&q=80',
              height: 340.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                Text('Bienvenue à IDWEY',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: primary)),
                SizedBox(height: 20.h),
                Text(
                  'l’application IDWEY.tn vous permet en quelques étapes de chercher, explorer, réserver et payer les bons plans aventures Outdoor.',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton.primary(
                    onPressed: () {
                      // Handle login button press
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Se connecter'),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton.secondaryColor(
                    onPressed: () {
                      // Handle sign-up button press
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('S’inscrire'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChaletRoomsBottomSheet extends StatelessWidget {
  final DetailsPageState state;
  const ChaletRoomsBottomSheet({Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w, bottom: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chalets Disponible",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
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
                                fit: BoxFit.cover,
                                imageUrl:
                                    state.hostDetails?.rooms?[index].imageId ??
                                        ""),
                          ),
                        ),
                        // Column of Information
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.hostDetails?.rooms?[index].title ?? "",
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
                                      " • X${state.hostDetails?.rooms?[index].adults!.toString() ?? ""}",
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
                                      " • X${state.hostDetails?.rooms?[index].adults!.toString() ?? ""}",
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
                  return const Divider();
                },
                itemCount: state.hostDetails!.rooms!.length),
          ],
        ),
      ),
    );
  }
}

class DescriptionBottomSheet extends StatelessWidget {
  final String description;
  const DescriptionBottomSheet({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w, bottom: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Desription",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            const Divider(),
            Html(
              //  key: _widgetKey,
              data: description,
              style: {
                "body": Style(
                  //  margin: EdgeInsets.zero,
                  //padding: EdgeInsets.zero,

                  fontSize: FontSize(
                      Theme.of(context).textTheme.bodySmall?.fontSize ?? 14),
                  fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                  fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
