import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/cards/card_type.dart';
import 'package:idwey/components/chips/chip.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/theme/app_colors.dart';
import 'dart:math' as math;

class CustomCard extends StatefulWidget {
  final String? title;
  final String? discount;
  final String? adress;
  final String? url;
  final String? price;
  final String? nbPerson;
  final String? type;
  final bool? fromHomepage;
  final int? currencyValue;
  final String? currency;
  final String? duration;
  final String? term;
  final CardType? cardType;
  final String? date;
  final bool? isExpired;
  final bool? isFeatured;
  bool? isFavorite;
  final Function(bool)? onFavoriteTap;
  final VoidCallback? onTap;

  CustomCard.host(
      {Key? key,
      this.currencyValue,
      this.currency,
      this.url,
      this.fromHomepage,
      this.title,
      this.adress,
      this.price,
      this.nbPerson,
      this.term,
      this.type,
      this.date,
      this.onFavoriteTap,
      this.isFavorite = false,
      this.isFeatured,
      this.onTap,
      this.discount})
      : cardType = CardType.host,
        duration = null,
        isExpired = null,
        super(key: key);
  CustomCard.event(
      {Key? key,
      this.currencyValue,
      this.currency,
      this.url,
      this.fromHomepage,
      this.title,
      this.adress,
      this.price,
      this.nbPerson,
      this.term,
      this.type,
      this.date,
      this.isExpired,
      this.onFavoriteTap,
      this.isFavorite = false,
      this.isFeatured,
      this.onTap,
      this.discount})
      : cardType = CardType.event,
        duration = null,
        super(key: key);

  CustomCard.activity(
      {Key? key,
      this.currencyValue,
      this.currency,
      this.url,
      this.fromHomepage,
      this.title,
      this.adress,
      this.price,
      this.nbPerson,
      this.term,
      this.type,
      this.date,
      this.isExpired,
      this.onFavoriteTap,
      this.isFavorite = false,
      this.duration,
      this.isFeatured,
      this.onTap,
      this.discount})
      : cardType = CardType.activity,
        super(key: key);
  CustomCard.experience(
      {Key? key,
      this.currencyValue,
      this.currency,
      this.url,
      this.fromHomepage,
      this.title,
      this.adress,
      this.price,
      this.nbPerson,
      this.term,
      this.type,
      this.date,
      this.isExpired,
      this.onFavoriteTap,
      this.isFavorite = false,
      this.duration,
      this.isFeatured,
      this.onTap,
      this.discount})
      : cardType = CardType.experience,
        super(key: key);

  CustomCard.product(
      {Key? key,
      this.currencyValue,
      this.currency,
      this.url,
      this.fromHomepage,
      this.title,
      this.adress,
      this.price,
      this.nbPerson,
      this.term,
      this.type,
      this.date,
      this.isExpired,
      this.onFavoriteTap,
      this.isFavorite = false,
      this.duration,
      this.isFeatured,
      this.onTap,
      this.discount})
      : cardType = CardType.product,
        super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? () {},
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Visibility(
                      visible: widget.discount != null &&
                          widget.discount!.isNotEmpty &&
                          widget.discount != "null",
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                        child: Container(
                          height: 310.h,
                          color: primaryOrange,
                        ),
                      ),
                    ),
                    Container(
                      foregroundDecoration: widget.discount != null &&
                              widget.discount!.isNotEmpty &&
                              widget.discount != "null"
                          ? BadgeDecoration(
                              badgeColor: primaryOrange,
                              badgeSize: 70.r,
                              textSpan: TextSpan(
                                text: "${widget.discount}%",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ))
                          : null,
                      child: SizedBox(
                        height: 300.h,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.url ??
                                "https://plus.unsplash.com/premium_photo-1680871320511-8be2085ff281?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=659&q=80",
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: SizedBox(
                                width: 50.w,
                                height: 50.h,
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                widget.cardType == CardType.event
                    ? widget.term == null || widget.term == ""
                        ? const SizedBox.shrink()
                        : Positioned(
                            left: 10.w,
                            top: 20.h,
                            child: CustomChip(
                              label: widget.term ?? "",
                              onSelected: (v) {},
                            ),
                          )
                    : widget.cardType != null && widget.isFeatured == true
                        ? Positioned(
                            left: 10.w,
                            top: 20.h,
                            child: CustomChip(
                              label: widget.cardType != CardType.event
                                  ? 'En Vedette'
                                  : widget.type ?? "",
                              onSelected: (v) {},
                            ),
                          )
                        : const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  widget.adress == "" || widget.adress == null
                      ? const SizedBox.shrink()
                      : SizedBox(
                          height: 2.h,
                        ),
                  widget.adress == "" || widget.adress == null
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Text(
                            widget.adress ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                  widget.date == "" || widget.date == null
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Text(
                            widget.date ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                  widget.duration == "" || widget.duration == null
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Text(
                            "Durée ${widget.duration} H",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                  Row(
                    children: [
                      Text(
                        "${double.parse(widget.price ?? "0").toInt().toString()} DT",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Row(
                        children: [
                          widget.cardType == CardType.host
                              ? Text(
                                  widget.type == "Par Personne"
                                      ? "/ personne"
                                      : "/nuit",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              : widget.cardType == CardType.product
                                  ? Text(
                                      "",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  : Text(
                                      "/ personne",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                          SizedBox(
                            width: 10.w,
                          ),
                          widget.nbPerson != null || widget.nbPerson != ""
                              ? Text(
                                  widget.nbPerson ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontWeight: FontWeight.w500),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            widget.isExpired != null && widget.isExpired == true
                ? CustomButton.secondaryGrey(
                    onPressed: () {},
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: Text('Evènement Expiré ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: primaryOrange)),
                        ),
                      ),
                    ),
                  )
                : CustomButton.primary(
                    onPressed: () {
                      widget.onTap?.call();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: widget.cardType == CardType.product
                              ? Text('Votre commande = ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))
                              : Text('Réserver Maintenant = ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                        ),
                        SvgPicture.asset(
                          Assets.tree,
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class BadgeDecoration extends Decoration {
  final Color badgeColor;
  final double badgeSize;
  final TextSpan textSpan;
  const BadgeDecoration(
      {required this.badgeColor,
      required this.badgeSize,
      required this.textSpan});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _BadgePainter(badgeColor, badgeSize, textSpan);
  }
}

class _BadgePainter extends BoxPainter {
  static const double BASELINE_SHIFT = 1;
  static double CORNER_RADIUS = 12.r;
  final Color badgeColor;
  final double badgeSize;
  final TextSpan textSpan;

  _BadgePainter(this.badgeColor, this.badgeSize, this.textSpan);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    canvas.save();
    canvas.translate(
        offset.dx + configuration.size!.width - badgeSize, offset.dy);
    canvas.drawPath(buildBadgePath(), getBadgePaint());
    // draw text
    final hyp = math.sqrt(badgeSize * badgeSize + badgeSize * badgeSize);
    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainter.layout(minWidth: hyp, maxWidth: hyp);
    final halfHeight = textPainter.size.height / 2;
    final v = math.sqrt(halfHeight * halfHeight + halfHeight * halfHeight) +
        BASELINE_SHIFT;
    canvas.translate(v, -v);
    canvas.rotate(0.785398); // 45 degrees
    textPainter.paint(canvas, Offset.zero);
    canvas.restore();
  }

  Paint getBadgePaint() => Paint()
    ..isAntiAlias = true
    ..color = badgeColor;

  Path buildBadgePath() => Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(RRect.fromLTRBAndCorners(0, 0, badgeSize, badgeSize,
            topRight: Radius.circular(CORNER_RADIUS))),
      Path()
        ..lineTo(0, badgeSize)
        ..lineTo(badgeSize, badgeSize)
        ..close());
}
