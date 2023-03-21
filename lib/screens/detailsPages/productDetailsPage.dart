import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../models/product.dart';
import '../../services/productCalls.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/ImageCommon.dart';
import '../../widgets/common/detailsWidgets.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';

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
      ProductDetails(0, '', '', '', '', '', '', '', [], []);

  String currentImage = '';

  callProduct() {
    setState(() {
      loading = true;
    });
    ProductCalls.getProductDetails(widget.id).then((product) async {
      setState(() {
        productDetails = product;
        currentImage = product.gallery_images_url[0].large;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
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
                          ]),
                Footer(),
                CreatedBy(),
                BackToTop(scrollToTop),
                SizedBox(height: 70),
              ],
            ),
          ),
          !loading
              ? BottomReservationBar(
                  per_person: "",
                  sale_price: productDetails.sale_price!,
                  price: productDetails.price!,
                )
              : Container()
        ],
      ),
    );
  }
}
