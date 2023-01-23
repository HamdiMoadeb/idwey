import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/models/product.dart';

import '../../utils/colors.dart';
import '../../utils/utils.dart';

class ProductListItem extends StatefulWidget {
  Product product;
  ProductListItem(this.product);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 400,
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.product.IMAGE_URL!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 35,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 15),
            child: Text(
              widget.product.title!,
              style: TextStyle(
                color: titleBlack,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 10, top: 8, bottom: 5),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: 14,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Text(
                  'Jeux de société',
                  style: TextStyle(
                    color: titleBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 8, bottom: 15),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.bolt,
                  size: 14,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Text(
                  '${removeDecimalZeroFormat(widget.product.price!)} DT',
                  style: TextStyle(
                    color: titleBlack,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              color: primaryOrange,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Votre commande = ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.tree,
                  size: 15,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
