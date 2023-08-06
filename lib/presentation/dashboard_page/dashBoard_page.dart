import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              elevation: 10,
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
                      ? Column(
                          children: [
                            const SizedBox(height: 8),
                            ShaderMask(
                              blendMode: BlendMode.srcATop,
                              shaderCallback: (Rect bounds) {
                                return kLinearGradient.createShader(bounds);
                              },
                              child: SvgPicture.asset(
                                Assets.inspiration,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Inspiration",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 8),
                            SvgPicture.asset(
                              Assets.inspiration,
                              height: 20,
                              width: 20,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Inspiration",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                ),
                BottomNavigationBarItem(
                    label: '',
                    icon: tabsRouter.activeIndex == 2
                        ? Column(
                            children: [
                              const SizedBox(height: 8),
                              ShaderMask(
                                blendMode: BlendMode.srcATop,
                                shaderCallback: (Rect bounds) {
                                  return kLinearGradient.createShader(bounds);
                                },
                                child: SvgPicture.asset(
                                  Assets.assurance,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Assurance",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(height: 8),
                              SvgPicture.asset(
                                Assets.assurance,
                                height: 20,
                                width: 20,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Assurance",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      height: 65,
                      width: 65,
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
                                ), // Use the same gradient colors as the background

                          borderRadius: BorderRadius.circular(50)),
                      child: Container(
                        margin: const EdgeInsets.all(2),
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
                    label: '',
                    icon: tabsRouter.activeIndex == 3
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (Rect bounds) {
                                  return kLinearGradient.createShader(bounds);
                                },
                                child: SvgPicture.asset(
                                  Assets.products,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Produits",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              SvgPicture.asset(
                                Assets.products,
                                height: 20,
                                width: 20,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Produits",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )),
                BottomNavigationBarItem(
                    label: '',
                    icon: tabsRouter.activeIndex == 4
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (Rect bounds) {
                                  return kLinearGradient.createShader(bounds);
                                },
                                child: SvgPicture.asset(
                                  Assets.profile,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Se connecter",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              SvgPicture.asset(
                                Assets.profile,
                                height: 20,
                                width: 20,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Se connecter",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )),
              ],
            ));
      },
    );
  }
}
