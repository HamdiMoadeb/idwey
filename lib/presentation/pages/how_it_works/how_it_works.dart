import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/presentation/pages/how_it_works/sections/about_section/about_section.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: materialPrimary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Divider(
                thickness: 1,
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Text(
                  'Comment ca marche ?',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 28.sp),
                  textAlign: TextAlign.start,
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              const AboutSection(
                list: [
                  "Parce qu’on représente le premier guide régional tunisien tout en se focalisant sur les aspects écologique, culturel et éducatif. Notre rôle est de promouvoir le développement territorial en sensibilisant à pratiquer une nouvelle tendance touristique plus responsable.",
                ],
                sectionTitle: "A propos de Idwey",
                subtitle: "Pourquoi Idwey ?",
              ),
              const Divider(
                thickness: 1,
              ),
              const AboutSection(
                list: [
                  "Vos informations personnelles sont soigneusement gardées dans nos bases de données et ne sont divulguées ni vendus à aucune tierce partie, ni même aux autres voyageurs.",
                  "Idwey est une plateforme de réservation en ligne qui permet aux voyageurs de réserver des expériences authentiques et uniques en Tunisie. Nous offrons aux voyageurs la possibilité de découvrir la Tunisie autrement en leur proposant des activités et des expériences authentiques et uniques.",
                  "Idwey est une plateforme de réservation en ligne qui permet aux voyageurs de réserver des expériences authentiques et uniques en Tunisie. Nous offrons aux voyageurs la possibilité de découvrir la Tunisie autrement en leur proposant des activités et des expériences authentiques et uniques.",
                ],
                sectionTitle: "Réservations",
                subtitle:
                    "Mes informations personnelles sont-elles en sécurité avec IDWEY ?",
              ),
              const Divider(
                thickness: 1,
              ),
              const AboutSection(
                  list: [
                    "Une fois paiement effectué, vous allez recevoir un mail de confirmation avec tous les détails de votre réservation quel que soit votre mode de paiement Aussi vous allez avoir un voucher si vous payez sur place."
                  ],
                  sectionTitle: "Paiement",
                  subtitle:
                      "Vais-je recevoir une confirmation après mon paiement ?")
            ],
          ),
        ));
  }
}
