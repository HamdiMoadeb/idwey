import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:idwey/presentation/pages/auth/sign_up/sign_up_tab2.dart';
import 'package:idwey/presentation/pages/auth/sign_up/sign_up_tab3.dart';
import 'package:idwey/theme/app_colors.dart';

import 'sign_up_tab1.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  /// focus nodes
  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  double _progress = 1 / 3;
  int currentPage = 0;

  final PageController _progressController = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    emailController.addListener(() {
      context
          .read<SignUpBloc>()
          .add(SignUpEvent.setEmail(emailController.text));
    });
    passwordController.addListener(() {
      context
          .read<SignUpBloc>()
          .add(SignUpEvent.setPassword(passwordController.text));
    });
    nameController.addListener(() {
      context
          .read<SignUpBloc>()
          .add(SignUpEvent.setFirstName(nameController.text));
    });
    confirmPasswordController.addListener(() {
      context
          .read<SignUpBloc>()
          .add(SignUpEvent.setConfirmPassword(confirmPasswordController.text));
    });

    ///
    emailFocus.dispose();
    nameFocus.dispose();
    confirmPasswordFocus.dispose();
    passwordFocus.dispose();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: IconButton(
                    onPressed: () {
                      GetIt.I<AppRouter>().pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    )),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  "S'inscrire",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              centerTitle: true,
              bottom: const PreferredSize(
                  child: Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  preferredSize: Size.fromHeight(16.0)),
            ),
            body: NestedScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[];
              },
              body: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _progressController,
                      //physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (int page) {
                        setState(() {
                          currentPage = page;
                          _progress = (currentPage + 1) /
                              3; // Update the progress based on the current page
                        });
                      },
                      children: [
                        SignUpTab1(
                          nameController: nameController,
                          focusNode: nameFocus,
                        ),
                        SignUpTab2(
                          emailController: emailController,
                          focusNode: emailFocus,
                        ),
                        SignUpTab3(
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                          passwordFocusNode: passwordFocus,
                          confirmPasswordFocusNode: confirmPasswordFocus,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          child: Text(
                            "${currentPage + 1}/3",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: primaryOrange),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(10.0),
                          minHeight: 10.0,
                          value: _progress,
                          color: primaryOrange,
                          backgroundColor: Colors.grey[300],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomButton.primary(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: const Text('Suivant'),
                          ),
                          onPressed: () {
                            if (currentPage == 3) {
                              context.read<SignUpBloc>().signUp();
                            }
                            setState(() {
                              _progressController.animateToPage(currentPage + 1,
                                  duration: const Duration(milliseconds: 3),
                                  curve: Curves.easeInOut);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
