import 'package:flutter/material.dart';
import 'package:idwey/models/desire.dart';

class DesireListItem extends StatefulWidget {
  Desire desire;
  DesireListItem(this.desire);

  @override
  State<DesireListItem> createState() => _DesireListItemState();
}

class _DesireListItemState extends State<DesireListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      margin: EdgeInsets.only(left: 15),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
      ),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                widget.desire.image_id!,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          Positioned(
            top: 145,
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              child: Center(
                child: Text(
                  widget.desire.name!.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}