import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';

import '../../models/product.dart';
import '../../services/productCalls.dart';
import '../../utils/utils.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/listItems/productListItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  SharedPreferences? prefs;

  List<Product> listProducts = [];
  bool loading = false;
  bool showFAB = false;
  int listLengthFromLastCall = 0;
  Map currencies = {
    'TND': {'value': 1, 'symbol': 'DT'},
    'EUR': {'value': 0, 'symbol': '€'},
    'USD': {'value': 0, 'symbol': '\$'},
  };
  String selectedCurrency = '';

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  callProducts() async {
    setState(() {
      loading = true;
    });
    await _loadSelectedCurrency();
    ProductCalls.getProductList(listProducts.length).then((result) async {
      setState(() {
        listLengthFromLastCall = result['list'].length;
        listProducts.addAll(result['list']);
        currencies['EUR']['value'] = result["eur"];
        currencies['USD']['value'] = result["usd"];
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  Future<void> _loadSelectedCurrency() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCurrency = prefs?.getString('selectedCurrency') ?? 'TND';
    });
  }

  @override
  void initState() {
    super.initState();

    checkInternetConnectivity(context, callProducts);

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 2000) >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange &&
          !loading &&
          !(listLengthFromLastCall < 20)) {
        callProducts();
      }

      scrollController.addListener(() {
        if (scrollController.position.pixels > 1000) {
          setState(() {
            showFAB = true;
          });
        }
        if (scrollController.position.pixels < 1000) {
          setState(() {
            showFAB = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
      changeCurrency: _loadSelectedCurrency(),
      scaffoldKey: _scaffoldKey,
      backtotop: scrollToTop,
      showFab: showFAB,
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
              Column(
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
                        child: ProductListItem(
                            listProducts[index],
                            currencies[selectedCurrency]['value'],
                            currencies[selectedCurrency]['symbol'])),
                    itemCount: listProducts.length,
                  ),
                ],
              ),
              loading
                  ? Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(primary),
                        ),
                      ),
                    )
                  : Container(),
              //footer
              Footer(),
              CreatedBy(),
              BackToTop(scrollToTop),
            ]),
      ),
    );
  }
}
