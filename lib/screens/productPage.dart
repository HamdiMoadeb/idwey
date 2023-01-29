import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';

import '../models/product.dart';
import '../services/productCalls.dart';
import '../widgets/common/footer.dart';
import '../widgets/listItems/productListItem.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
      scaffoldKey: _scaffoldKey,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 230,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset("assets/productcover.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Jeux et produits',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const ProductList(),
              //footer
              Footer(),
              CreatedBy(),
              BackToTop(scrollToTop),
            ]),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductCalls.getProductList(),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          final List<Product> listProducts = snapshot.data!.toList();

          if (listProducts != null) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "${listProducts.length} produits trouvés",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: titleBlue,
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.only(bottom: 15, right: 15),
                      child: ProductListItem(listProducts[index])),
                  itemCount: listProducts.length,
                ),
              ],
            );
          }
        }

        return Container(
          margin: EdgeInsets.only(top: 30),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primary),
            ),
          ),
        );
      },
    );
  }
}
