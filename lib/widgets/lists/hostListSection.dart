import 'package:flutter/material.dart';
import 'package:idwey/services/hostCalls.dart';
import 'package:idwey/widgets/listItems/hostListItem.dart';

import '../../utils/colors.dart';

class HostListSection extends StatefulWidget {
  const HostListSection({Key? key}) : super(key: key);

  @override
  State<HostListSection> createState() => _HostListSectionState();
}

class _HostListSectionState extends State<HostListSection> {
  @override
  void initState() {
    super.initState();

    HostCalls().getAllHosts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 15),
          child: Text(
            'Logements authentiques',
            style: TextStyle(
              color: primary,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          height: 10,
          indent: 15,
          endIndent: 15,
        ),
        Container(
          margin: EdgeInsets.only(top: 8, left: 15, right: 15),
          child: Text(
            'Vous cherchez où passer la nuit ? Y\'a pas mieux que les logements authentiques',
            style: TextStyle(
              color: grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 15),
          child: Row(
            children: [
              Spacer(),
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    child: Icon(
                      Icons.navigate_before_sharp,
                      color: primary,
                      size: 25,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.white,
                      shape: CircleBorder(
                          side: BorderSide(
                        color: Colors.grey.shade300,
                      )),
                      padding: EdgeInsets.zero,
                      primary: Colors.white,
                    )),
              ),
              Container(
                width: 30,
                height: 30,
                child: ElevatedButton(
                    child: Icon(
                      Icons.navigate_next_sharp,
                      color: primary,
                      size: 25,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.white,
                      shape: CircleBorder(
                          side: BorderSide(
                        color: Colors.grey.shade300,
                      )),
                      padding: EdgeInsets.zero,
                      primary: Colors.white,
                    )),
              ),
            ],
          ),
        ),
        HostListItem(),
      ],
    );
  }
}
