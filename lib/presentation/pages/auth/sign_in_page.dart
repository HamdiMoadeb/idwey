import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/components/verify_disponibility_bottom_sheet_content/bottom_sheet.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:idwey/utils/form_utils.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool visiblePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    emailController.addListener(() {
      context
          .read<SignInBloc>()
          .add(SignInEvent.setEmail(emailController.text));
    });
    passwordController.addListener(() {
      context
          .read<SignInBloc>()
          .add(SignInEvent.setPassword(passwordController.text));
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final AppRouter appRouter = GetIt.I<AppRouter>();

  showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.status == StateStatus.loading) {
          showLoadingDialog();
        } else if (state.status == StateStatus.success) {
          print("success");

          context.read<SignInBloc>().initStatus();
        } else if (state.status == StateStatus.error) {
          print("error");
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorText ?? "Une erreur s'est produite"),
              backgroundColor: Colors.red,
            ),
          );
          context.read<SignInBloc>().initStatus();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: IconButton(
                  onPressed: () {
                    appRouter.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  )),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Text(
                "Se connecter",
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomInput(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      onSubmit: (value) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                      foregroundColor: Colors.grey[300]!),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomInput(
                      suffix: IconButton(
                        color: Colors.grey[400],
                        onPressed: () {
                          setState(() {
                            visiblePassword = !visiblePassword;
                          });
                        },
                        icon: visiblePassword == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      obscureText: visiblePassword,
                      onSubmit: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Mot de passe",
                      foregroundColor: Colors.grey[300]!),
                  SizedBox(
                    height: 36.h,
                  ),
                  CustomButton.primary(
                      child: Padding(
                        padding: EdgeInsets.all(8.h),
                        child: const Text("Se connecter"),
                      ),
                      onPressed: emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty &&
                              state.isValid == true
                          ? () {
                              context
                                  .read<SignInBloc>()
                                  .add(const SignInEvent.signIn());
                            }
                          : null),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, left: 4.w, right: 4.w),
                    child: InkWell(
                      onTap: () {
                        GetIt.I<AppRouter>()
                            .push(const TermsAndConditionsRoute());
                      },
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: "En Continuant vous acceptez ",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 12.sp),
                            children: [
                              TextSpan(
                                  text: "les termes et conditions",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 12.sp)),
                              TextSpan(
                                text: " d'idwey",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 12.sp),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  InkWell(
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
                              height: MediaQuery.of(context).size.height * 0.9,
                              child: const ForgetPasswordBottomSheet());
                        },
                      );
                    },
                    child: Text('Mot de passe oublié ?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 12.sp)),
                  ),
                  /*Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: const Divider(
                            thickness: 1,
                          ),
                        ),
                        Text(
                          "OR",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey[400]),
                        ),
                        SizedBox(
                          width: 150.w,
                          child: const Divider(
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton.secondaryBlack(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.w),
                        child: Row(
                          children: [
                            Image.asset(Assets.google),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text("Continuer avec google",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton.secondaryBlack(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.facebook),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text("Continuer avec facebook",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500))
                          ],
                        ),
                      )),*/
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
