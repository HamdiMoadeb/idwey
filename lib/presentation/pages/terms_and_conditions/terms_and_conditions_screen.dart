import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  ScrollController _scrollController = ScrollController();
  bool showAcceptButton = false;
  double progress = 0;
  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      progress = _scrollController.offset;
      if (_scrollController.offset.h > 1000) {
        setState(() {
          showAcceptButton = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                showAcceptButton == true
                    ? CustomButton.primary(
                        onPressed: () {
                          context.router.pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16.w),
                          child: Text("Accepter et continuer",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500)),
                        ))
                    : SizedBox.shrink(),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton.secondaryColor(
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                      child: Text("Vers le bas",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontSize: 18.sp,
                                  color: primaryOrange,
                                  fontWeight: FontWeight.w500)),
                    )),
              ],
            ),
          ),
        ),
      ),
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
            "Terms and Conditions",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Theme(
          data: ThemeData(
            highlightColor: primaryOrange, //Does not work
          ),
          child: Scrollbar(
            controller: _scrollController,
            // trackVisibility: true,
            thumbVisibility: true,
            thickness: 7,
            interactive: true,
            radius: const Radius.circular(10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Conditions d'utilisation et règles de sécurité",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                    child: Text(
                        "IDWEY est une plateforme web qui permet aux personnes voyageurs ou locaux de vivre des expériences Outdoor dans le cadre du tourisme régional et responsable. Les utilisateurs vont recenser et noter ces expériences afin de permettre à tout le monde de les découvrir et d’en profiter. La raison d’être de IDWEY est le partage des informations sur les sites de tourisme régional ; l’échange d’expérience entre utilisateurs. Ainsi, c’est dans ce but qu’a été développé IDWEY, permettant la mise en relation des voyageurs avec les prestataires de services touristiques, afin de leur permettre de profiter de manière optimale de leur expérience. Le recours aux services de IDWEY suppose l’adhésion et le respect des règles visées dans les présentes conditions générales d’utilisation."),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "OBJET",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          "IDWEY offre la possibilité à toute personne physique de 15 ans et plus, tout représentant d’une personne morale ou tout représentant d’un groupement de s’inscrire sur le site web pour permettre la mise en relation entre un prestataire et un voyageur, la localisation et la description de site touristique sous réserve du respect des présentes conditions générale d’utilisation. IDWEY ne fait qu’assurer la commercialisation sur le site web des annonces des prestataires et des descriptions des sites à destination des voyageurs. IDWEY n’est pas une agence de voyage, n’organise pas et ne vend pas de voyages ou de séjours individuels ou collectifs et/ou de services pouvant être fournis à l’occasion de voyages ou de séjours.")),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "INSCRIPTION",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          "L’accès à IDWEY se fait via l’URL www.Idwey.tn. La simple consultation et l’inscription au site web sont gratuites. L’inscription peut également se formaliser via vos comptes de réseaux sociaux.")),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "PAIEMENT ET FACTURATION",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          "Pour les clients individuels, le paiement peut s'effectuer par virement, en ligne ou dans les points de vente de IDWEY. Il est à noter que IDWEY reçoit une commission à la transaction sur les services de commercialisation. Pour les associations, la gestion et la commercialisation sur leurs actions écologiques est gratuite.")),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "OBLIGATION DE L’UTILISATEUR",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          "L’utilisateur doit lire et accepter les présentes CONDITIONS GÉNÉRALES D’UTILISATION. Dès lors, après en avoir pris connaissance, il les valide électroniquement, il est indéniablement présumé en avoir eu connaissance, les avoir acceptées et de s’y soumettre sans réserve.")),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "OBLIGATION DU PRESTATAIRE :",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          "En acceptant les présentes CONDITIONS GÉNÉRALES D’UTILISATION, le prestataire déclare pratiquer l’accueil de voyageurs à titre occasionnel, reconnaît et accepte qu’il est responsable de toutes les annonces de l'offre qu’il publie, qu’il est en règle vis-à-vis des lois en vigueur, que son activité est bien existante ainsi que sa disponibilité, lors de l’arrivée du voyageur pour lequel la réservation a été validée. Le prestataire dispose d’un délai de 24 heures à compter de la demande de réservation formulée par le voyageur pour prendre connaissance de la demande et faire savoir s’il est en mesure d’y répondre favorablement. L’absence de réponse du prestataire dans le délai visé, autorisera IDWEY à suspendre le compte du prestataire. En cas de réitération d’absence de réponse dans un délai de 24 heures à compter de la formalisation de la demande, IDWEY pourra supprimer le compte. Il est rappelé au prestataire et au voyageur que leurs relations sont susceptibles d’être régies par les règles de la responsabilité civile contractuelle prévue par le Code civil dans le cadre des relations contractuelles qui s’instaurent entre eux après la mise en relation grâce à la plateforme IDWEY. Ainsi, IDWEY n’est pas partie à ce contrat et ne garantit donc pas le respect des engagements pris par ces derniers dans le cadre de leurs échanges.")),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "PROHIBITION DE FACTURATIONS SUPPLÉMENTAIRES",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          "Dans le cadre des sollicitations d’accueil générées via IDWEY, le prestataire accepte d’accueillir le voyageur dans le respect des CONDITIONS GÉNÉRALES D’UTILISATION et s’interdit toute demande de paiement complémentaire ou toute facturation non expressément proposée par IDWEY lors du renseignement de l’offre en ligne, hors dépôt de caution éventuelle. Le prestataire demeure, cependant, libre de proposer des prestations supplémentaires payantes au cours de l’accueil, s’il le souhaite, pour agrémenter la venue du voyageur, IDWEY n’intervenant à aucun moment dans l’organisation de ces prestations supplémentaires.")),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "OBLIGATION DE SÉCURITÉ DU PRESTATAIRE :",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          "Dans le cadre de l’accueil du voyageur, le prestataire est susceptible de lui faire découvrir des sites de pratiques sportives ou des sites archéologiques. Il assume à ce titre toutes les responsabilités liées à la découverte des lieux en question, à la gestion des risques potentiels et qui peuvent varier en fonction du lieu. Le voyageur reconnaît donc, que IDWEY n’assume aucune responsabilité dans l’organisation de la découverte de ces sites présentés par lui-même, par le prestataire, ou par un autre utilisateur, pas plus que la pratique d’une activité Outdoor dans ces lieux. Le prestataire s’engage à faire preuve de prudence et à respecter l’ensemble des réglementations permettant d’assurer la sécurité de chacun. Si toutefois la responsabilité de IDWEY devait être engagée pour un dommage affectant une personne en raison de faits découlant de ces faits, le prestataire et/ou le voyageur relèvera et garantira IDWEY de l’ensemble des conséquences dommageables qui pourraient être la conséquence de toute action menée contre elle à ce titre.")),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "LOYAUTE DU PRESTATAIRE :",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          "La loi impose un principe de bonne foi contractuelle interdisant au prestataire de recourir aux services de IDWEY pour pouvoir, après une première mise en relation avec un voyageur via IDWEY, bénéficier par la suite de contacts directs permettant de contourner la plateforme. Le prestataire s’engage à n’utiliser que la plateforme IDWEY pour continuer toute opération avec le voyageur mis en relation à travers IDWEY ainsi qu’à renvoyer le voyageur s’il le sollicite directement sans passer par IDWEY.")),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "DESCRIPTION DU LIEU D’ACCUEIL DU PRESTATAIRE:",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          "L'offre proposée par le prestataire est illustrée par un ou plusieurs photographies pour permettre au voyageur de visualiser le plus fidèlement possible le lieu d’accueil avant de finaliser, éventuellement, sa réservation. Une description accompagne ces photos et décrit les caractéristiques essentielles et rappelle le tarif de réservation proposé, ainsi que les dates auxquelles l’accueil peut être réalisé. Ceci est, afin d’éviter toute déception du voyageur une fois sur place. Le voyageur doit donc bien prendre connaissance du descriptif de l’offre.")),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "CONDITIONS DE SÉCURITÉ",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  )),
                  const SliverToBoxAdapter(
                      child: Text(
                          '''IDWEY s’engage à ne pas divulguer toute information recueillies par l’utilisateur ou le prestataire. Chaque donnée entrée est confidentielle, notamment des paiements ; carte de crédit ; numéro et email.
    En tant que voyageur, les données qui comptent vos préférences, lieux de prédilection vont être utilisées pour pouvoir vous mettre en lien avec des publicités qui vont avec ce que vous désirez. Mais toute autre information sur votre compte seront confidentielles.
    En tant que prestataire, vos emplacements et vos services seront mis à la disposition des utilisateurs pour vous mettre en lien avec eux. Mais tout autre information sur votre compte personnel et vos transactions seront confidentielles.
    Toutes les informations, de quelque nature que ce soit, que l’une des parties a pu recueillir sur l’autre partie, sous quelque forme que ce soit (orale ou écrite) doivent êtres confidentielles. Ainsi, chaque partie s’engage, d’une part, à ne pas divulguer, ni à communiquer à quiconque tout ou partie de ces informations confidentielles et, d’autre part, à prendre toute disposition pour que cette confidentialité soit préservée. Chaque partie, en qualité de bénéficiaire, s’engage à ne faire aucun usage des informations confidentielles dans un but autre que l’exécution du Contrat.''')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
