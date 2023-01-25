import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/colors.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      height: 760,
      color: footerBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Text(
            'BESOIN D\'AIDE?',
            style: TextStyle(
                color: primary, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(
                  width: 20,
                  thickness: 3,
                  color: primaryOrange,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appelez-nous',
                      style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '+216 31 106 666',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(
                  width: 20,
                  thickness: 3,
                  color: primaryOrange,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Horaire',
                      style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lundi -> Vendredi',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Text(
                      '10:00 -> 18:00',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(
                  width: 20,
                  thickness: 3,
                  color: primaryOrange,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adresse',
                        style: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Text(
                          '63 Avenue Habib Bourguiba (Immeuble Le Parnasse), 7ème étage. Tunis, Tunisie',
                          style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
          Text(
            'EXPLORER',
            style: TextStyle(
                color: primary, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          Text(
            'A propos',
            style: TextStyle(
                color: primary, fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SizedBox(height: 20),
          Text(
            'Devenir partenaire',
            style: TextStyle(
                color: primary, fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SizedBox(height: 20),
          Text(
            'Condition d\'utilisation ',
            style: TextStyle(
                color: primary, fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SizedBox(height: 20),
          Text(
            'Contact',
            style: TextStyle(
                color: primary, fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SizedBox(height: 20),
          Text(
            'FAQs',
            style: TextStyle(
                color: primary, fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SizedBox(height: 35),
          Text(
            'SUIVEZ NOUS',
            style: TextStyle(
                color: primary, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(
                  width: 20,
                  thickness: 3,
                  color: primaryOrange,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suivez nous',
                      style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.facebookF,
                            size: 15,
                            color: primary,
                          ),
                          FaIcon(
                            FontAwesomeIcons.instagram,
                            size: 15,
                            color: primary,
                          ),
                          FaIcon(
                            FontAwesomeIcons.linkedin,
                            size: 15,
                            color: primary,
                          ),
                          FaIcon(
                            FontAwesomeIcons.youtube,
                            size: 15,
                            color: primary,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreatedBy extends StatelessWidget {
  const CreatedBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'Made with ❤️ in Tunisia © 2023, Powered by ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'IDWEY',
                style: TextStyle(
                  color: primaryOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackToTop extends StatelessWidget {
  const BackToTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      margin: EdgeInsets.only(left: 10, bottom: 10, top: 5),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(
          FontAwesomeIcons.anglesUp,
          color: primaryOrange,
          size: 20,
        ),
      ),
    );
  }
}
