import 'package:flutter_share/flutter_share.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:icofont_flutter/icofont_flutter.dart';

import '../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailIcons extends StatelessWidget {
  IconData icon;
  String description;
  String type;
  DetailIcons(
      {Key? key,
      required this.icon,
      required this.description,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 35.0,
          color: titleBlue,
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: grey),
            )
          ],
        )
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  String title;
  SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 30,
                color: primaryOrange,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: titleBlack),
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(thickness: 1)),
      ],
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(top: 10, bottom: 20),
        child: const Divider(thickness: 1));
  }
}

class AnimatedHeartButton extends StatefulWidget {
  bool isLiked;
  Function() funCallback;
  bool appearanceColor;
  AnimatedHeartButton(
      {Key? key,
      required this.isLiked,
      required this.funCallback,
      required this.appearanceColor})
      : super(key: key);

  @override
  State<AnimatedHeartButton> createState() => _AnimatedHeartButtonState();
}

class _AnimatedHeartButtonState extends State<AnimatedHeartButton>
    with TickerProviderStateMixin {
  AnimationController? _iconAnimationController;

  void _onTap() {
    widget.funCallback();
    _iconAnimationController?.forward().then((value) {
      _iconAnimationController?.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 125),
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: widget.appearanceColor == false
                ? primaryOrange
                : Colors.black.withOpacity(0.5),
          ),
          child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: ScaleTransition(
                scale: _iconAnimationController!,
                child: Icon(
                  widget.isLiked == false
                      ? FontAwesomeIcons.heart
                      : FontAwesomeIcons.solidHeart,
                  color: Colors.white,
                  size: 20,
                ),
              )),
        ));
  }
}

class DropDownSocialButton extends StatefulWidget {
  bool appearanceColor;
  String title;
  String text;
  String linkUrl;
  DropDownSocialButton(
      {Key? key,
      required this.appearanceColor,
      required this.title,
      required this.text,
      required this.linkUrl})
      : super(key: key);

  @override
  State<DropDownSocialButton> createState() => _DropDownSocialButtonState();
}

class _DropDownSocialButtonState extends State<DropDownSocialButton> {
  Future<void> share(String title, String text, String linkUrl) async {
    await FlutterShare.share(
      title: widget.title,
      text: widget.text,
      linkUrl: widget.linkUrl,
    );
  }

  void _onTap() {
    share(widget.title, widget.title, widget.title);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.appearanceColor == false
              ? primaryOrange
              : Colors.black.withOpacity(0.5),
        ),
        child: Icon(
          FontAwesomeIcons.shareNodes,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class ConvenienceItem extends StatelessWidget {
  String title;
  ConvenienceItem({Key? key, required this.title}) : super(key: key);
  Icon getIcon(String status) {
    switch (status) {
      case "Douche":
        return Icon(
          IcoFontIcons.bathtub,
          color: grey,
          size: 35,
        );
      case "Parking gratuit":
        return Icon(
          IcoFontIcons.car,
          color: grey,
          size: 35,
        );
      case "Piscine":
        return Icon(
          IcoFontIcons.swimmer,
          color: grey,
          size: 35,
        );
      case "Cuisine équipé":
        return Icon(
          IcoFontIcons.checked,
          color: grey,
          size: 35,
        );
      case "Convient aux familles avec enfants":
        return Icon(
          IcoFontIcons.users,
          color: grey,
          size: 30,
        );
      case "Climatisation":
        return Icon(
          Icons.ac_unit_sharp,
          color: grey,
          size: 35,
        );
      case "Équipements de base":
        return Icon(
          IcoFontIcons.hanger,
          color: grey,
          size: 35,
        );
      case "Petit déjeuner":
        return Icon(
          IcoFontIcons.tea,
          color: grey,
          size: 35,
        );
      default:
        return Icon(
          Icons.help_outline,
          color: grey,
          size: 35,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getIcon(title),
        SizedBox(
          width: 15,
        ),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            title,
            style: TextStyle(color: materialPrimary),
          ),
        )
      ],
    );
  }
}

class RateStats extends StatelessWidget {
  const RateStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(15.0),
          height: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: primaryGrey)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                        color: primaryOrange,
                        fontWeight: FontWeight.w500,
                        fontSize: 60),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Text(
                      "/5",
                      style: TextStyle(
                          color: primaryOrange,
                          fontWeight: FontWeight.w500,
                          fontSize: 24),
                    ),
                  ),
                ],
              ),
              Text(
                "Pas Noté",
                style: TextStyle(fontSize: 24, color: materialPrimary),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "basée sur ",
                    style: TextStyle(
                        color: grey, fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Text(
                    "0 avis",
                    style: TextStyle(
                        color: primaryOrange,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 15),
              RatingProgressRow(title: "Excellent", percent: 0),
              SizedBox(height: 15),
              RatingProgressRow(title: "Trés bien", percent: 0),
              SizedBox(height: 15),
              RatingProgressRow(title: "Moyenne", percent: 0),
              SizedBox(height: 15),
              RatingProgressRow(title: "Pauvre", percent: 0),
              SizedBox(height: 15),
              RatingProgressRow(title: "Terrible", percent: 0),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          alignment: Alignment.topRight,
          child: Text(
            "Pas d\'avis",
            style: TextStyle(color: grey),
          ),
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            height: 50,
            decoration: BoxDecoration(
                color: primaryGrey,
                border: Border(
                  left: BorderSide(
                    width: 5.0,
                    color: materialPrimary,
                  ),
                )),
            child: RichText(
              text: TextSpan(
                text: 'Vous devez ',
                style: TextStyle(color: materialPrimary, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                      text: 'vous connecter ',
                      style: TextStyle(color: primaryOrange)),
                  TextSpan(text: 'pour écrire un avis'),
                ],
              ),
            )),
      ],
    );
  }
}

class RatingProgressRow extends StatelessWidget {
  double percent;
  String title;
  RatingProgressRow({Key? key, required this.percent, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyle(color: materialPrimary),
          ),
        ),
        new LinearPercentIndicator(
          width: 220.0,
          lineHeight: 8.0,
          percent: percent,
          barRadius: Radius.circular(10),
          progressColor: Colors.red,
        ),
        Text("0", style: TextStyle(color: materialPrimary)),
      ],
    );
  }
}

class BottomReservationBar extends StatelessWidget {
  String price;
  String per_person;
  BottomReservationBar(
      {Key? key, required this.price, required this.per_person})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          width: MediaQuery.of(context).size.width,
          height: 75,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 0.2, color: grey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '${price} DT',
                        style: TextStyle(
                            color: titleBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' /${per_person}',
                              style: TextStyle(
                                  color: grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text("0 avis", style: TextStyle(color: grey))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 170,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                    color: primaryOrange,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Text(
                      "Réserver".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Maintenant".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
