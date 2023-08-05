import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
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
  final String? term;
  final CardType? cardType;
  final String? date;
  final bool? isExpired;
  bool? isFavorite;
  final Function(bool)? onFavoriteTap;

  CustomCard.host(
      {this.currencyValue,
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
      this.isFavorite = false})
      : cardType = CardType.host,
        isExpired = null;
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
      this.isFavorite = false})
      : cardType = CardType.event,
        super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 340,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.url ??
                        "https://plus.unsplash.com/premium_photo-1680871320511-8be2085ff281?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=659&q=80",
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 20,
                child: CustomChip(
                  label: widget.cardType == CardType.host
                      ? 'En Vedette'
                      : widget.type ?? "",
                  onSelected: (bool) {},
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title ?? "host.title!",
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
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                widget.adress == "" || widget.adress == null
                    ? const SizedBox()
                    : Text(
                        widget.adress ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                const SizedBox(
                  height: 4,
                ),
                widget.date == "" || widget.date == null
                    ? SizedBox()
                    : Text(
                        widget.date ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "${double.parse(widget.price!).toInt().toString()} DT",
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
                            : Text(
                                "/ personne",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                        const SizedBox(
                          width: 10,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: widget.isExpired != null && widget.isExpired == true
                ? CustomButton.secondaryColor(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Evènement Expiré',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                        ),
                        SvgPicture.asset(
                          Assets.tree,
                          height: 20,
                        ),
                      ],
                    ),
                  )
                : CustomButton.primary(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Réserver Maintenant = ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                        ),
                        SvgPicture.asset(
                          Assets.tree,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
