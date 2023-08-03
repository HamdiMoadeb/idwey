import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/components/filter_item/filter_item.dart';
import 'package:idwey/constants/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: 'Search',
          //       border: OutlineInputBorder(),
          //     ),
          //   ),
          // ),
          FilterList(),
        ],
      ),
    );
  }
}

class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            FilterItem(
              label: 'Hébergement',
              icon: Assets.inspiration,
              onTap: (bool) {
                setState(() {
                  selectedIndex = 0;
                });
              },
              isSelected: selectedIndex == 0,
            ),
            FilterItem(
              label: 'Evenement',
              icon: Assets.inspiration,
              onTap: (bool) {
                setState(() {
                  selectedIndex = 1;
                });
              },
              isSelected: selectedIndex == 1,
            ),
            FilterItem(
              label: 'Acitvités',
              icon: Assets.inspiration,
              onTap: (bool) {
                setState(() {
                  selectedIndex = 2;
                });
              },
              isSelected: selectedIndex == 2,
            ),
            FilterItem(
              label: 'Produits',
              icon: Assets.inspiration,
              onTap: (bool) {
                setState(() {
                  selectedIndex = 3;
                });
              },
              isSelected: selectedIndex == 3,
            ),
            FilterItem(
              label: 'Articles',
              icon: Assets.inspiration,
              onTap: (bool) {
                setState(() {
                  selectedIndex = 4;
                });
              },
              isSelected: selectedIndex == 4,
            ),
            // Add more filters here
          ],
        ),
      ),
    );
  }
}
