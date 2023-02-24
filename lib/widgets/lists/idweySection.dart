import 'package:flutter/material.dart';
import 'package:idwey/models/idweyForces.dart';

import '../../services/homePageCalls.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../ForcesSectionItem.dart';

class IdweySection extends StatefulWidget {
  const IdweySection({Key? key}) : super(key: key);

  @override
  State<IdweySection> createState() => _IdweySectionState();
}

class _IdweySectionState extends State<IdweySection> {
  IdweyForces? idweyForces;

  getIdweySection() {
    HomePageCalls.getIdweySectionData().then((value) {
      setState(() {
        idweyForces = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getIdweySection();
  }

  @override
  Widget build(BuildContext context) {
    return idweyForces != null
        ? Container(
            height: 1350,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width,
                  child: ClipPath(
                    clipper: CustomClips(),
                    child: Container(
                      height: 400,
                      color: primary,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    height: 1250,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 0),
                    color: primary,
                    child: Column(
                      children: [
                        Text(
                          '${idweyForces!.title}',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '${idweyForces!.desc} ↓',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        vertical: 17, horizontal: 27)),
                            elevation: MaterialStateProperty.all<double>(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            'Notre Concept',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Column(
                          children: List.generate(idweyForces!.list_item.length,
                              (index) {
                            return ForcesSectionItem(
                                idweyForces!.list_item[index]);
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
