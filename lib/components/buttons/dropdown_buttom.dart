import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/theme/app_colors.dart';

class CustomDropDownMenuButton extends StatefulWidget {
  final String? selectedOption;
  final bool? showDropDown;
  final List<String> items;
  final Function(String) onChanged;

  const CustomDropDownMenuButton(
      {Key? key,
      this.selectedOption,
      required this.onChanged,
      this.showDropDown,
      required this.items})
      : super(key: key);

  @override
  State<CustomDropDownMenuButton> createState() =>
      _CustomDropDownMenuButtonState();
}

class _CustomDropDownMenuButtonState extends State<CustomDropDownMenuButton> {
  String selectedOption = "";
  bool dropdownIsVisible = true;
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    dropdownIsVisible = widget.showDropDown!;
    selectedOption = widget.selectedOption ?? "";
    print("dropdownIsVisible");
    print(dropdownIsVisible);
    print("selectedOption");
    print(selectedOption);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: dropdownIsVisible,
          child: InkWell(
            onTap: () {
              setState(() {
                dropdownIsVisible = !dropdownIsVisible;
              });
            },
            child: Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              radius: const Radius.circular(12),
              child: TypeAheadField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _typeAheadController,
                  decoration: InputDecoration(
                    labelText: 'Où allez-vous, région, votre destination',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.grey[400], fontSize: 16.sp),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        Assets.search,
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        )),
                  ),
                ),
                suggestionsCallback: (pattern) {
                  print("pattern");
                  print(pattern);
                  return widget.items.where((item) =>
                      item.toLowerCase().contains(pattern.toLowerCase()));
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: HeroIcon(
                            HeroIcons.mapPin,
                            color: Colors.grey,
                            size: 20,
                          ),
                        )),
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    print("suggestion");
                    print(suggestion);
                    selectedOption = suggestion;

                    dropdownIsVisible = !dropdownIsVisible;

                    _typeAheadController.text = suggestion;
                    widget.onChanged(suggestion);
                  });
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: selectedOption != '' && dropdownIsVisible == false,
          child: InkWell(
            onTap: () {
              setState(() {
                dropdownIsVisible = !dropdownIsVisible;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.search,
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      text: "Destination : ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      children: [
                        TextSpan(
                          text: selectedOption,
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmplacementDropDownMenuButton extends StatefulWidget {
  final String? selectedOption;
  final bool? showDropDown;
  final List<String> items;
  final Function(String) onChanged;

  const EmplacementDropDownMenuButton(
      {Key? key,
      this.selectedOption,
      required this.onChanged,
      this.showDropDown,
      required this.items})
      : super(key: key);

  @override
  State<EmplacementDropDownMenuButton> createState() =>
      _EmplacementDropDownMenuButtonState();
}

class _EmplacementDropDownMenuButtonState
    extends State<EmplacementDropDownMenuButton> {
  String selectedOption = "";
  bool dropdownIsVisible = true;
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    dropdownIsVisible = widget.showDropDown!;
    selectedOption = widget.selectedOption ?? "";
    print("dropdownIsVisible");
    print(dropdownIsVisible);
    print("selectedOption");
    print(selectedOption);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: dropdownIsVisible,
          child: InkWell(
            onTap: () {
              setState(() {
                dropdownIsVisible = !dropdownIsVisible;
              });
            },
            child: Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              radius: const Radius.circular(12),
              child: TypeAheadField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _typeAheadController,
                  decoration: InputDecoration(
                    labelText: 'Ajouter votre emplacement',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.grey[400], fontSize: 16.sp),
                    prefixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: HeroIcon(
                          HeroIcons.map,
                          color: Colors.black,
                          size: 24,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        )),
                  ),
                ),
                suggestionsCallback: (pattern) {
                  print("pattern");
                  print(pattern);
                  return widget.items.where((item) =>
                      item.toLowerCase().contains(pattern.toLowerCase()));
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: HeroIcon(
                            HeroIcons.mapPin,
                            color: Colors.grey,
                            size: 20,
                          ),
                        )),
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  setState(() {
                    print("suggestion");
                    print(suggestion);
                    selectedOption = suggestion;

                    dropdownIsVisible = !dropdownIsVisible;

                    _typeAheadController.text = suggestion;
                    widget.onChanged(suggestion);
                  });
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: selectedOption != '' && dropdownIsVisible == false,
          child: InkWell(
            onTap: () {
              setState(() {
                dropdownIsVisible = !dropdownIsVisible;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: [
                  const HeroIcon(HeroIcons.map, color: Colors.black, size: 24),
                  const SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      text: "Le prochain emplacement : ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      children: [
                        TextSpan(
                          text: selectedOption,
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
