import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:idwey/screens/authPages/loginPage.dart';
import 'package:idwey/screens/verify_disponibility_page/verify_disponibility_page.dart';
import 'package:idwey/utils/enums.dart';

import '../../models/product.dart';
import '../../services/productCalls.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/ImageCommon.dart';
import '../../widgets/common/detailsWidgets.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsPage extends StatefulWidget {
  int id;
  ProductDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  bool loading = false;
  bool showFAB = false;
  bool isLiked = false;
  ProductDetails productDetails =
      ProductDetails(0, '', '', '', '', '', '', '', [], [], '', '', '');
  SharedPreferences? prefs;

  String currentImage = '';
  Map currencies = {
    'TND': {'value': 1, 'symbol': 'DT'},
    'EUR': {'value': 0, 'symbol': '€'},
    'USD': {'value': 0, 'symbol': '\$'},
  };
  String selectedCurrency = '';
  callProduct() {
    setState(() {
      loading = true;
    });
    ProductCalls.getProductDetails(widget.id).then((result) async {
      setState(() {
        productDetails = result['productDetails'];
        currentImage = result['productDetails'].gallery_images_url[0].large;
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
    checkInternetConnectivity(context, callProduct);
    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
      changeCurrency: _loadSelectedCurrency(),
      showFab: showFAB,
      backtotop: scrollToTop,
      scaffoldKey: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loading
                    ? Container(
                        height: 300,
                        margin: EdgeInsets.all(30),
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(primary),
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageBanner(
                            title: productDetails.title!,
                            text: "Partager maintenant",
                            linkUrl:
                                "https://idwey.tn/fr/product/${productDetails.slug}",
                            banner_image_url: productDetails.banner_image_url,
                            isLiked: isLiked,
                            callBack: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 20.0, left: 20.0),
                                  child: Text(
                                    '${productDetails.title}',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: titleBlack),
                                  ),
                                ),
                              ]),
                          SectionDivider(),
                          ImageGallery(
                            title: productDetails.title!,
                            text: "Partager maintenant",
                            linkUrl:
                                "https://idwey.tn/fr/product/${productDetails.slug}",
                            currentImage: currentImage,
                            isLiked: isLiked,
                            gallery_images_url:
                                productDetails.gallery_images_url,
                            callBack: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                          ),
                          SectionTitle(title: 'DESCRIPTION'),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20),
                            child: HtmlWidget(
                              productDetails.content!,
                            ),
                          ),
                          OwnerWidget(
                            name: productDetails.business_name,
                            image: productDetails.author_image_url,
                            date: productDetails.created_at,
                          )
                        ],
                      ),
                Footer(),
                CreatedBy(),
                BackToTop(scrollToTop),
                SizedBox(height: 70),
              ],
            ),
          ),
          !loading
              ? BottomReservationBar(
                  onPressed: () {
                    checkLoggedIn();
                  },
                  per_person: "",
                  sale_price: productDetails.sale_price!,
                  price:
                      '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, productDetails.price!) : productDetails.price!)} ${currencies[selectedCurrency]['symbol']}',
                )
              : Container()
        ],
      ),
    );
  }

  Future<void> checkLoggedIn() async {
    final user = prefs!.getString("token");
    if (user != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyDisponibility(
                    // activityDuration: productDetails.duration,
                    typeReservation: TypeReservation.product,
                    //typeHost: widget.typeHost,
                    sale_price: productDetails.price,
                    currency: currencies[selectedCurrency]['symbol'],
                    currencyValue: currencies[selectedCurrency]['value']!,
                    price: productDetails.price,
                    // per_person: eventDetails.,
                    currencyName: selectedCurrency,
                    id: productDetails.id.toString(),
                    title: productDetails.title ?? "", address: '',
                    // address: productDetails.address!,
                  )));
    } else {
      prefs!.setString('activityID', productDetails.id.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
