import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController reviewController = TextEditingController();
  FocusNode reviewFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    reviewController.dispose();
    reviewFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: materialPrimary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              thickness: 1,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const HeroIcon(HeroIcons.chatBubbleLeftEllipsis),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    'Votre avis nous intéresse',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.w,
              ),
              Container(
                height: 300.h, // Set the desired height for the text input
                padding:
                    const EdgeInsets.all(10), // Optional padding for text input
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey, // Set border color
                    width: 1, // Set border width
                  ),
                  borderRadius: BorderRadius.circular(
                      10.r), // Optional: Apply border radius for a rounded look
                ),
                child: TextField(
                  controller: reviewController,
                  focusNode: reviewFocusNode,
                  maxLines: null, // Allow multiple lines of text
                  keyboardType:
                      TextInputType.multiline, // Enable multiline input
                  decoration: InputDecoration(
                    hintText: 'Ajouter votre avis..', // Placeholder text
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder:
                        InputBorder.none, // Remove the default border
                    contentPadding: EdgeInsets.zero, // Remove padding
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding:
                    const EdgeInsets.all(10), // Optional padding for text input
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey, // Set border color
                    width: 1, // Set border width
                  ),
                  borderRadius: BorderRadius.circular(
                      10.r), // Optional: Apply border radius for a rounded look
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Evaluer avec des étoiles",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(
                      "Dans quelle mesure recommanderiez-vous Idwey à vos amis?",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const HeroIcon(
                          HeroIcons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButton.secondaryBlack(
                  onPressed: () {
                    _showDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Soumettre",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 100,
                  color: primaryOrange,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Félicitations \n votre avis est bien reçu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton.primary(
                  child: const Text('Trouvez votre prochaine aventure'),
                  onPressed: () {
                    context.router.popUntilRoot();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
