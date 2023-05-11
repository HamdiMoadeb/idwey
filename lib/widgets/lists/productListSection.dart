import 'package:flutter/material.dart';
import 'package:idwey/models/product.dart';
import 'package:idwey/services/productCalls.dart';
import 'package:idwey/widgets/listItems/productListItem.dart';

import '../../utils/colors.dart';

class ProductListSection extends StatefulWidget {
  String? selectedCurrency;
  Map? currencies;
  ProductListSection({Key? key, this.selectedCurrency, this.currencies})
      : super(key: key);

  @override
  State<ProductListSection> createState() => _ProductListSectionState();
}

class _ProductListSectionState extends State<ProductListSection> {
  List<Product> products = [];

  getAllProducts() {
    ProductCalls.getAllProducts().then((result) {
      setState(() {
        products = result['list'];
        widget.currencies!['EUR']['value'] = result["eur"];
        widget.currencies!['USD']['value'] = result["usd"];
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 15),
          child: Text(
            'Jeux et Produits ',
            style: TextStyle(
              color: primary,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
          child: Text(
            'Animez vos soirées en jouant 100% tunisien.',
            style: TextStyle(
              color: grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          height: 410,
          margin: EdgeInsets.only(top: 5, bottom: 20, right: 15),
          child: ListView.builder(
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => ProductListItem(
                products[index],
                widget.currencies![widget.selectedCurrency]['value'],
                widget.currencies![widget.selectedCurrency]['symbol']),
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
