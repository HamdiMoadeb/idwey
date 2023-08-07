import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/assets.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  );

  @override
  void initState() {
    super.initState();

    controller.forward();
    Future.delayed(
      const Duration(seconds: 3),
      () => AutoRouter.of(context).replace(const DashboardRoute()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
                size: 100,
                controller: controller,
                itemBuilder: (BuildContext context, int index) {
                  return SvgPicture.asset(
                    index.isEven ? Assets.logoDisabled : Assets.logoColor,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
