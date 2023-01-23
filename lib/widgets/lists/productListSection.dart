import 'package:flutter/material.dart';
import 'package:idwey/models/product.dart';
import 'package:idwey/services/productCalls.dart';
import 'package:idwey/widgets/listItems/productListItem.dart';

import '../../utils/colors.dart';

class ProductListSection extends StatefulWidget {
  const ProductListSection({Key? key}) : super(key: key);

  @override
  State<ProductListSection> createState() => _ProductListSectionState();
}

class _ProductListSectionState extends State<ProductListSection> {
  List<Product> products = [];

  getAllProducts() {
    ProductCalls.getAllProducts().then((list) {
      setState(() {
        products = list;
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
            'Produits',
            style: TextStyle(
              color: primary,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 400,
          margin: EdgeInsets.only(top: 5, bottom: 20, right: 15),
          child: ListView.builder(
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) =>
                ProductListItem(products[index]),
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
