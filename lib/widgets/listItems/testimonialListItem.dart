import 'package:flutter/material.dart';
import 'package:idwey/models/testimonial.dart';

import '../../utils/colors.dart';

class TestimonialListItem extends StatefulWidget {
  Testimonial testimonial;
  TestimonialListItem(this.testimonial);

  @override
  State<TestimonialListItem> createState() => _TestimonialListItemState();
}

class _TestimonialListItemState extends State<TestimonialListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 30,
          margin: EdgeInsets.only(left: 15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage(widget.testimonial.avatar_url!),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.testimonial.name!,
                        maxLines: 5,
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          widget.testimonial.number_star!,
                          (index) {
                            return Icon(Icons.star,
                                color: Colors.yellow, size: 18);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 10),
                child: Text(
                  widget.testimonial.desc!,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
