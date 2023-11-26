import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/fidelity_program_bloc/fidelity_program_bloc.dart';
import 'package:idwey/presentation/pages/fidelit_program/sections/advanture_month_section.dart';
import 'package:idwey/presentation/pages/fidelit_program/sections/super_adventure.dart';

@RoutePage()
class FidelityProgramScreen extends StatefulWidget implements AutoRouteWrapper {
  const FidelityProgramScreen({Key? key}) : super(key: key);

  @override
  State<FidelityProgramScreen> createState() => _FidelityProgramScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (context) => FidelityProgramBloc(), child: this);
  }
}

class _FidelityProgramScreenState extends State<FidelityProgramScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print("initState");
    BlocProvider.of<FidelityProgramBloc>(context)
        .add(const FidelityProgramEvent.getMonthlyPoints());
    BlocProvider.of<FidelityProgramBloc>(context)
        .add(const FidelityProgramEvent.getTotalPoints());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FidelityProgramBloc, FidelityProgramState>(
      builder: (context, state) {
        if (state.status == StateStatus.loading ||
            state.statusRange == StateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Text(
                "Programme de Fidélité",
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
            child: Column(
              children: [
                AdventureMonthSection(
                  rank: state.rank ?? "0",
                  points: state.monthlyPoints ?? "0",
                ),
                SuperAdventureSection(
                  points: state.totalPoints ?? "0",
                  points2: state.totalPoints2 ?? "0",
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        children: [
                          Row(children: [
                            HeroIcon(
                              HeroIcons.trophy,
                              size: 24.sp,
                              color: Colors.black,
                              style: HeroIconStyle.solid,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              state.list?[index] ?? "",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                          ]),
                          const SizedBox(height: 10),
                          Text(
                            state.listContent?[index] ?? "",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: state.list!.length,
                  controller: ScrollController(),
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
