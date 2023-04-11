import 'package:flutter/material.dart';

import '../../models/experience.dart';
import '../../utils/colors.dart';

class FilterTab extends StatefulWidget {
  Function() filtringListFunction;
  Function() showMoreFunction;
  List<Terms> displayedList;
  bool showAllAct;

  FilterTab(
      {Key? key,
      required this.filtringListFunction,
      required this.showMoreFunction,
      required this.displayedList,
      required this.showAllAct})
      : super(key: key);

  @override
  State<FilterTab> createState() => _FilterTabState();
}

class _FilterTabState extends State<FilterTab> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.topLeft,
            collapsedTextColor: titleBlack,
            textColor: titleBlack,
            childrenPadding: EdgeInsets.zero,
            title: Text(
              'Type de l\'expérience',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            children: [
              Column(children: [
                ...widget.displayedList.map(
                  (item) => CheckboxListTile(
                    title: Text(item.name!),
                    value: item.checked,
                    onChanged: (bool? value) {
                      widget.filtringListFunction();
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.showMoreFunction();
                  },
                  child: Text(!widget.showAllAct ? 'Plus' : 'Moins'),
                ),
              ])
            ]));
  }
}
