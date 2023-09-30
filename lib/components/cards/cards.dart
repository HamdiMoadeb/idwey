import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/cards/card_type.dart';
import 'package:idwey/components/chips/chip.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/theme/app_colors.dart';

class CustomCard extends StatefulWidget {
  final String? title;
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
      this.onTap})
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
      this.onTap})
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
      this.onTap})
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
      this.onTap})
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
      this.onTap})
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
                SizedBox(
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.isFavorite = !widget.isFavorite!;
                          });

                          //widget.onFavoriteTap?.call(widget.isFavorite!);
                        },
                        child: SvgPicture.asset(
                          widget.isFavorite == true
                              ? Assets.heartIconFilled
                              : Assets.heartIcon,
                          height: 30.h,
                          width: 30.w,
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
