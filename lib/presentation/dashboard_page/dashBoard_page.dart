import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
          elevation: 0,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
                label: 'Inspiration',
                icon: SvgPicture.asset(
                  Assets.inspiration,
                  height: 20,
                  width: 20,
                  color: tabsRouter.activeIndex == 0
                      ? primaryOrange
                      : Theme.of(context).colorScheme.onSurface,
                )),
            BottomNavigationBarItem(
                label: 'Assurance',
                icon: SvgPicture.asset(
                  Assets.assurance,
                  color: tabsRouter.activeIndex == 1
                      ? primaryOrange
                      : Theme.of(context).colorScheme.onSurface,
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                  height: 65,
                  width: 65,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      gradient:
                          kLinearGradient, // Use the same gradient colors as the background

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
                icon: SvgPicture.asset(
                  Assets.products,
                  height: 20,
                  width: 20,
                  color: tabsRouter.activeIndex == 3
                      ? primaryOrange
                      : Theme.of(context).colorScheme.onSurface,
                )),
            BottomNavigationBarItem(
                label: 'se connecter',
                icon: SvgPicture.asset(
                  Assets.profile,
                  height: 20,
                  width: 20,
                  color: tabsRouter.activeIndex == 4
                      ? primaryOrange
                      : Theme.of(context).colorScheme.onSurface,
                )),
          ],
        );
      },
    );
  }
}
