import 'package:flutter/material.dart';

class ForcesSectionItem extends StatefulWidget {
  String image;
  String title;
  String description;

  ForcesSectionItem(this.title, this.image, this.description);

  @override
  State<ForcesSectionItem> createState() => _ForcesSectionItemState();
}

class _ForcesSectionItemState extends State<ForcesSectionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 20),
            width: 70,
            height: 70,
            child: Image.asset('assets/${widget.image}'),
          ),
          Text(
            widget.title.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
