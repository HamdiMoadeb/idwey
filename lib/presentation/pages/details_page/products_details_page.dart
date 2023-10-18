import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/bottom_bar.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/components/read_more_text.dart';
import 'package:idwey/components/verify_disponibility_bottom_sheet_content/bottom_sheet.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';
import 'package:idwey/presentation/pages/details_page/components/product_page_header/product_page_header.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class DetailsProductScreen extends StatefulWidget {
  final int? id;
  const DetailsProductScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsProductScreen> createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen>
    with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  bool showAppBar = false;

  @override
  void initState() {
    BlocProvider.of<ProductDetailsBloc>(context)
        .add(ProductDetailsEvent.getDetailsProduct(widget.id ?? 0));

    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

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
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
            listener: (context, state) {
          if (state.addToCartStatus == StateStatus.loading) {
            showLoadingDialog();
          }
        }, builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return const Center(
              child: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          } else if (state.status == StateStatus.error &&
              state.productDetailsDto == null) {
            return const Center(
              child: Text("Error"),
            );
          } else if (state.status == StateStatus.success &&
              state.productDetailsDto != null) {
            return Scaffold(
              bottomNavigationBar: BottomAppBar(
                  elevation: 0,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
                    child: CustomButton.primary(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Commander maintenant = '),
                            SvgPicture.asset(
                              Assets.tree,
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        appState.isLoggedIn == true
                            ? context.read<ProductDetailsBloc>().add(
                                const ProductDetailsEvent.addToCart(
                                    TypeReservation.product))
                            : showModalBottomSheet(
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      child: const DraggableBottomSheet());
                                },
                              );
                      },
                    ),
                  )),
              body: Stack(
                children: [
                  CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      CustomSliverAppBar(
                        bannerWidget: ImageBanner(
                            listImages:
                                state.productDetailsDto?.galleryImagesUrl ??
                                    []),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.w, right: 16.w, bottom: 40.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomHeader(
                                onchange: (i) {
                                  print(i);
                                  context
                                      .read<ProductDetailsBloc>()
                                      .add(ProductDetailsEvent.addProduct(i));
                                },
                                title:
                                    state.productDetailsDto?.row?.title ?? "",
                                subtitle: "Jeux de societe",
                              ),
                              const Divider(),
                              Text(
                                "${double.parse(state.productDetailsDto?.row?.price ?? "0").toInt().toString()} DT",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp,
                                        color: primaryOrange),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                    child: VerticalDivider(
                                      thickness: 2,
                                      color: primaryOrange,
                                      width: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    "Description",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              ExpandableDescription(
                                description:
                                    state.productDetailsDto?.row?.content ?? "",
                                readMoreLabel: "Lire la suite",
                                readLessLabel: "Lire moins",
                                maxLines: 2,
                                isExpandable: true,
                                bodyColor: Colors.grey[500],
                                buttonColor: primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Scaffold(body: SizedBox()),
          );
        });
      },
    );
  }
}
