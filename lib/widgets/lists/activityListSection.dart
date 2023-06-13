import 'package:flutter/material.dart';
import 'package:idwey/models/activity.dart';
import 'package:idwey/models/currency.dart';
import 'package:idwey/services/activityCalls.dart';
import 'package:idwey/widgets/listItems/activityListItem.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/colors.dart';

class ActivityListSection extends StatefulWidget {
  String? selectedCurrency;
  Map? currencies;
  ActivityListSection({Key? key, this.selectedCurrency, this.currencies})
      : super(key: key);

  @override
  State<ActivityListSection> createState() => _ActivityListSectionState();
}

class _ActivityListSectionState extends State<ActivityListSection> {
  List<Activity> activities = [];
  final AutoScrollController controller = AutoScrollController();

  int _currentFocusedIndex = 0;

  getAllActivities() {
    ActivityCalls.getAllActivities().then((result) {
      setState(() {
        activities = result['list'];
        widget.currencies!['EUR']['value'] = result["eur"];
        widget.currencies!['USD']['value'] = result["usd"];
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getAllActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 15),
          child: Text(
            'Ateliers et Activités',
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
          margin: EdgeInsets.only(top: 8, left: 15, bottom: 5, right: 15),
          child: Text(
            'Vous avez besoin d’un bouffé d’air! Choisissez votre date et partez à la découverte des nouvelles activités.',
            style: TextStyle(
              color: grey,
              fontSize: 13,
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
                    onPressed: () {
                      if (_currentFocusedIndex > 0) {
                        _currentFocusedIndex--;
                        controller.scrollToIndex(_currentFocusedIndex,
                            preferPosition: AutoScrollPosition.begin);

                        setState(() {});
                      }
                    },
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
                    onPressed: () {
                      if (_currentFocusedIndex < activities.length - 1) {
                        _currentFocusedIndex++;
                        controller.scrollToIndex(_currentFocusedIndex,
                            preferPosition: AutoScrollPosition.begin);
                        setState(() {});
                      }
                    },
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
        Container(
          height: 440,
          margin: EdgeInsets.only(top: 5, bottom: 20, right: 15),
          child: ListView.builder(
            controller: controller,
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => AutoScrollTag(
              key: ValueKey(index),
              controller: controller,
              index: index,
              child: VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (info.visibleFraction == 1) {
                    setState(() {
                      _currentFocusedIndex = index;
                    });
                  }
                },
                child: ActivityListItem(
                    activities[index],
                    widget.currencies![widget.selectedCurrency]['value'],
                    widget.currencies![widget.selectedCurrency]['symbol']),
              ),
            ),
            itemCount: activities.length,
          ),
        ),
      ],
    );
  }
}
