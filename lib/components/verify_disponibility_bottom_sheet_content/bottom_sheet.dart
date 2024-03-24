import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/inputs/custom_input.dart';
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
            child: Image.asset(
              Assets.background,
              height: 340.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                Text('Que l\'aventure commence ',
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
                      GetIt.I<AppRouter>().push(const SignInRoute());
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
                      GetIt.I<AppRouter>().push(const SignUpRoute());
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
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                "Chalets Disponibles",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: 16.h,
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
                                imageUrl: state
                                        .hostDetails?.rooms?[index].imageId
                                        .toString() ??
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
              "Description",
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

class ForgetPasswordBottomSheet extends StatefulWidget {
  const ForgetPasswordBottomSheet({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordBottomSheet> createState() =>
      _ForgetPasswordBottomSheetState();
}

class _ForgetPasswordBottomSheetState extends State<ForgetPasswordBottomSheet> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// add listener on controller

    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 16.h, bottom: 16.h),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton.primary(
                  onPressed: emailController.text.isEmpty
                      ? null
                      : () {
                          GetIt.I<AppRouter>().push(const DashboardRoute());
                        },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Réinitialiser mon mot de passe'),
                  ),
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.h, right: 16.h, top: 60.h, bottom: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(Assets.frame),
                Text(
                  "Reset your password",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomInput(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    foregroundColor: Colors.grey[300]!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// choose source to pick an image gallery or camera

class ChooseImageSourceBottomSheet extends StatelessWidget {
  final Function() onCameraPressed;
  final Function() onGalleryPressed;
  const ChooseImageSourceBottomSheet(
      {Key? key, required this.onCameraPressed, required this.onGalleryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 30.h, bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choisissez une source",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton.textOnly(
                  onPressed: () {
                    onGalleryPressed();
                    GetIt.I<AppRouter>().pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Gallerie',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp)),
                  )),
              CustomButton.textOnly(
                onPressed: () {
                  onCameraPressed();
                  GetIt.I<AppRouter>().pop();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Camera',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
