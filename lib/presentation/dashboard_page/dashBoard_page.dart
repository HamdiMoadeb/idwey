import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        InspirationRoute(),
        AssuranceRoute(),
        MainHomeRoute(),
        ProductsRoute(),
        AuthRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          elevation: 10,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Inspiration',
              icon: tabsRouter.activeIndex == 0
                  ? Center(
                      child: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (Rect bounds) {
                        return kLinearGradient.createShader(bounds);
                      },
                      child: SvgPicture.asset(
                        Assets.inspiration,
                      ),
                    ))
                  : SvgPicture.asset(
                      Assets.inspiration,
                      height: 20,
                      width: 20,
                    ),
            ),
            BottomNavigationBarItem(
                label: 'Assurance',
                icon: tabsRouter.activeIndex == 1
                    ? Center(
                        child: ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (Rect bounds) {
                          return kLinearGradient.createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          Assets.assurance,
                        ),
                      ))
                    : SvgPicture.asset(
                        Assets.assurance,
                        height: 20,
                        width: 20,
                      )),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                  height: 65,
                  width: 65,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      gradient: tabsRouter.activeIndex == 2
                          ? kLinearGradient
                          : LinearGradient(
                              colors: [
                                Colors.grey[300]!,
                                Colors.grey[300]!,
                                Colors.grey[300]!,
                              ],
                            ), // Use the same gradient colors as the background

                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: 40,
                    width: 40,
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: SvgPicture.asset(
                      Assets.logoColor,
                    ),
                  ),
                )),
            BottomNavigationBarItem(
                label: 'Produits',
                icon: tabsRouter.activeIndex == 3
                    ? Center(
                        child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return kLinearGradient.createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          Assets.products,
                        ),
                      ))
                    : SvgPicture.asset(
                        Assets.products,
                        height: 20,
                        width: 20,
                      )),
            BottomNavigationBarItem(
                label: 'Se connecter',
                icon: tabsRouter.activeIndex == 4
                    ? Center(
                        child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return kLinearGradient.createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          Assets.profile,
                        ),
                      ))
                    : SvgPicture.asset(
                        Assets.profile,
                        height: 20,
                        width: 20,
                      )),
          ],
        );
      },
    );
  }
}
