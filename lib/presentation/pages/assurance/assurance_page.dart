import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/verify_disponibility_bottom_sheet_content/bottom_sheet.dart';

import '../../../theme/app_colors.dart';

@RoutePage()
class AssuranceScreen extends StatefulWidget {
  const AssuranceScreen({Key? key}) : super(key: key);

  @override
  State<AssuranceScreen> createState() => _AssuranceScreenState();
}

class _AssuranceScreenState extends State<AssuranceScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                    height: 316.h, // Adjust the height as needed
                    child: Image.asset("assets/Rectangle 2.png",
                        fit: BoxFit.cover)),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 12.w, right: 12.w, top: 10.h, bottom: 40.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: Text(
                          "Offre d'assurance 20 DT par personne par an",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500, color: primary),
                        ),
                      ),
                      Text(
                        '''Grâce à notre convention avec l'assurance star et suite à la demande de la communauté Idwey .👨‍👩‍👧‍ Nous avons mis à votre disposition notre nouveau service assurance .✊ Ce contrat vous assure pendant une année de la date de son obtention durant toutes les sorties organisées par les partenaires de la plateforme Idwey.tn .😎 L'assurance star vous permet de toucher les capitaux suivant :🤩
                      - 200 DT de frais médicaux
                      - 10 000 DT en cas d'incapacité
                      - 10 000 DT en cas de décès \n vous allez recevoir votre assurance, automatiquement, par mail dans un délai de 72 h à une semaine après la soumission et le paiement de votre demande et vous pouvez à tout moment avoir l'originale au bureau.''',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000)),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton.primary(
                          onPressed: () {
                            // Handle login button press
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
                                    height: MediaQuery.of(context).size.height *
                                        0.9,
                                    child: const DraggableBottomSheet());
                              },
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Se connecter'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
