import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertySection extends StatefulWidget {
  const PropertySection({Key? key}) : super(key: key);

  @override
  State<PropertySection> createState() => _PropertySectionState();
}

class _PropertySectionState extends State<PropertySection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Text(
              "Type de propriété",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedIndex == 0
                                    ? Colors.black
                                    : Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Auberge',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == 0
                                ? Colors.black
                                : Colors.grey[400]!,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedIndex == 1
                                    ? Colors.black
                                    : Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Centre de camping',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == 1
                                ? Colors.black
                                : Colors.grey[400]!,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedIndex == 2
                                    ? Colors.black
                                    : Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Ferme écologique',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == 2
                                ? Colors.black
                                : Colors.grey[400]!,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedIndex == 3
                                  ? Colors.black
                                  : Colors.grey[400]!,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Dôme écologique',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == 3
                                ? Colors.black
                                : Colors.grey[400]!,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 4;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedIndex == 4
                                  ? Colors.black
                                  : Colors.grey[400]!,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Maison d\'hôtes',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == 4
                                ? Colors.black
                                : Colors.grey[400]!,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 5;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedIndex == 5
                                  ? Colors.black
                                  : Colors.grey[400]!,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Refuge de montagne',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == 5
                                ? Colors.black
                                : Colors.grey[400]!,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 6;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedIndex == 6
                                  ? Colors.black
                                  : Colors.grey[400]!,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Chambre d\'hôtes',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == 6
                                ? Colors.black
                                : Colors.grey[400]!,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 7;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedIndex == 7
                                  ? Colors.black
                                  : Colors.grey[400]!,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Maison de vacances',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == 7
                                ? Colors.black
                                : Colors.grey[400]!,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
