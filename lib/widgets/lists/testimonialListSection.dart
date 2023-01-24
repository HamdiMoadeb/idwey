import 'package:flutter/material.dart';
import 'package:idwey/models/testimonial.dart';
import 'package:idwey/widgets/listItems/testimonialListItem.dart';

import '../../services/homePageCalls.dart';
import '../../utils/colors.dart';

class TestimonialListSection extends StatefulWidget {
  const TestimonialListSection({Key? key}) : super(key: key);

  @override
  State<TestimonialListSection> createState() => _TestimonialListSectionState();
}

class _TestimonialListSectionState extends State<TestimonialListSection> {
  List<Testimonial> testimonials = [];

  getAllTestimonials() {
    HomePageCalls.getAllTestimonials().then((list) {
      setState(() {
        testimonials = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getAllTestimonials();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 15),
          child: Text(
            'Avis des cliens',
            style: TextStyle(
              color: primary,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 180,
          margin: EdgeInsets.only(top: 5, bottom: 20, right: 15),
          child: ListView.builder(
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) =>
                TestimonialListItem(testimonials[index]),
            itemCount: testimonials.length,
          ),
        ),
      ],
    );
  }
}
