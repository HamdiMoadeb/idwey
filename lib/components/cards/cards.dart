import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/cards/card_type.dart';
import 'package:idwey/components/chips/chip.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/theme/app_colors.dart';

class CustomCard extends StatelessWidget {
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

  const CustomCard.host(
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
      this.date})
      : cardType = CardType.host,
        isExpired = null;
  const CustomCard.event(
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
      this.isExpired})
      : cardType = CardType.event,
        super(key: key);

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
                    imageUrl: url ??
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
                  label: cardType == CardType.host ? 'En Vedette' : type ?? "",
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
                        title ?? "host.title!",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const HeroIcon(HeroIcons.heart),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                adress == "" || adress == null
                    ? SizedBox()
                    : Text(
                        adress ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                SizedBox(
                  height: 4,
                ),
                date == "" || date == null
                    ? SizedBox()
                    : Text(
                        date ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "${double.parse(price!).toInt().toString()} DT",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Row(
                      children: [
                        cardType == CardType.host
                            ? Text(
                                type == "Par Personne" ? "/ personne" : "/nuit",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            : Text(
                                "/ personne",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          nbPerson ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: isExpired != null && isExpired == true
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
