import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return AutoTabsRouter(
          homeIndex: 2,
          // list of your tab routes
          // routes used here must be declared as children
          // routes of /dashboard
          routes: const [
            MainHomeRoute(), // MainHomeRoute as a child
            InspirationRoute(), //1
            AssuranceRoute(), //2
            ProductsRoute(), //3
            AuthRoute(), //4
          ],
          transitionBuilder: (context, child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
                body: child,
                bottomNavigationBar: BottomNavigationBar(
                  useLegacyColorScheme: false,
                  // backgroundColor: Colors.transparent,
                  type: BottomNavigationBarType.fixed,
                  selectedFontSize: 10,
                  unselectedFontSize: 10,
                  // elevation: 10,
                  currentIndex: 0,
                  onTap: (index) {
                    // here we switch between tabs
                    if (index == 0) {
                      index = 1;
                      tabsRouter.setActiveIndex(index);
                    } else if (index == 1) {
                      index = 2;
                      tabsRouter.setActiveIndex(index);
                    } else if (index == 2) {
                      index = 0;
                      tabsRouter.setActiveIndex(index);
                    }
                    tabsRouter.setActiveIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: '',
                      icon: tabsRouter.activeIndex == 1
                          ? Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Column(
                                children: [
                                  SizedBox(height: 4.h),
                                  ShaderMask(
                                    blendMode: BlendMode.srcATop,
                                    shaderCallback: (Rect bounds) {
                                      return kLinearGradient
                                          .createShader(bounds);
                                    },
                                    child: SvgPicture.asset(
                                      Assets.inspiration,
                                      height: 20.h,
                                      width: 20.h,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  const Text(
                                    "Inspiration",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Column(
                                children: [
                                  SizedBox(height: 4.h),
                                  SvgPicture.asset(
                                    Assets.inspiration,
                                    height: 20.h,
                                    width: 20.h,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 4.h),
                                  const Text(
                                    "Inspiration",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
                    BottomNavigationBarItem(
                        label: '',
                        icon: tabsRouter.activeIndex == 2
                            ? Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Column(
                                  children: [
                                    SizedBox(height: 4.h),
                                    ShaderMask(
                                      blendMode: BlendMode.srcATop,
                                      shaderCallback: (Rect bounds) {
                                        return kLinearGradient
                                            .createShader(bounds);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.fidelity,
                                        height: 20.h,
                                        width: 20.h,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    const Text(
                                      "Mes points",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Column(
                                  children: [
                                    SizedBox(height: 4.h),
                                    SvgPicture.asset(
                                      Assets.fidelity,
                                      height: 20.h,
                                      width: 20.h,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 4.h),
                                    const Text(
                                      "Mes points",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                    BottomNavigationBarItem(
                        label: '',
                        icon: Container(
                          height: 50.w,
                          width: 50.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              gradient: tabsRouter.activeIndex == 0
                                  ? kLinearGradient
                                  : LinearGradient(
                                      colors: [
                                        Colors.grey[300]!,
                                        Colors.grey[300]!,
                                        Colors.grey[300]!,
                                      ],
                                    ),
                              // Use the same gradient colors as the background

                              borderRadius: BorderRadius.circular(50)),
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            clipBehavior: Clip.hardEdge,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: SvgPicture.asset(
                              Assets.logoColor,
                            ),
                          ),
                        )),
                    BottomNavigationBarItem(
                        label: '',
                        icon: tabsRouter.activeIndex == 3
                            ? Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Column(
                                  children: [
                                    SizedBox(height: 4.h),
                                    ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (Rect bounds) {
                                        return kLinearGradient
                                            .createShader(bounds);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.products,
                                        height: 20.h,
                                        width: 20.h,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    const Text(
                                      "Produits",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Column(
                                  children: [
                                    SizedBox(height: 4.h),
                                    SvgPicture.asset(
                                      Assets.products,
                                      height: 20.h,
                                      width: 20.h,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 4.h),
                                    const Text(
                                      "Produits",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                    BottomNavigationBarItem(
                        label: '',
                        icon: tabsRouter.activeIndex == 4
                            ? Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 4.h),
                                    ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (Rect bounds) {
                                        return kLinearGradient
                                            .createShader(bounds);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.profile,
                                        height: 20.h,
                                        width: 20.h,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      state.isLoggedIn == true
                                          ? "Profile"
                                          : "Se connecter",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: Column(
                                  children: [
                                    SizedBox(height: 4.h),
                                    SvgPicture.asset(
                                      Assets.profile,
                                      height: 20.h,
                                      width: 20.h,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      state.isLoggedIn == true
                                          ? "Profile"
                                          : "Se connecter",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                  ],
                ));
          },
        );
      },
    );
  }
}
