import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class SignUpFinalScreen extends StatefulWidget {
  const SignUpFinalScreen({Key? key}) : super(key: key);

  @override
  State<SignUpFinalScreen> createState() => _SignUpFinalScreenState();
}

class _SignUpFinalScreenState extends State<SignUpFinalScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'J\'accepte les ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: grey),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'conditions générales d\'utilisation',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomButton.primary(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: const Text('Get Started'),
                    ),
                    onPressed: isChecked == true
                        ? () {
                            context.router.push(const DashboardRoute());
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(Assets.frame2),
                    Text(
                      state.firstName!.substring(0, 2).toUpperCase() ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return kLinearGradient.createShader(bounds);
                    },
                    child: Text("${state.firstName} Idwey",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600))),
              ],
            ),
          ),
        );
      },
    );
  }
}