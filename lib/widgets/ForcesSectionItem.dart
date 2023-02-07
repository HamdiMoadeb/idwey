import 'package:flutter/material.dart';
import 'package:idwey/models/idweyForces.dart';

class ForcesSectionItem extends StatefulWidget {
  Forces force;

  ForcesSectionItem(this.force);

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
            child: Image.network('${widget.force.icon_url}'),
          ),
          Text(
            widget.force.name!.toUpperCase(),
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
              widget.force.desc!,
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
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
