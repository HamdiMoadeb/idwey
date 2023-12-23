import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

class SignUpTab2 extends StatefulWidget {
  final TextEditingController emailController;
  final FocusNode focusNode;
  const SignUpTab2(
      {Key? key, required this.emailController, required this.focusNode})
      : super(key: key);

  @override
  State<SignUpTab2> createState() => _SignUpTab2State();
}

class _SignUpTab2State extends State<SignUpTab2> {
  String username = "";
  @override
  void initState() {
    // TODO: implement initState
    username = context.read<SignUpBloc>().state.firstName ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: Text(
                "Salut $username ! ",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: primary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              child: const Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: Text(
                "Quel est votre e-mail?",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            TextField(
              controller: widget.emailController,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: "Adresse e-mail",
                hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.grey[400],
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        );
      },
    );
  }
}
