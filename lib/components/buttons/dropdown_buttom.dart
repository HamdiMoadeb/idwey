import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/constants/assets.dart';

class CustomDropDownMenuButton extends StatefulWidget {
  final String? selectedOption;

  const CustomDropDownMenuButton({Key? key, this.selectedOption})
      : super(key: key);

  @override
  State<CustomDropDownMenuButton> createState() =>
      _CustomDropDownMenuButtonState();
}

class _CustomDropDownMenuButtonState extends State<CustomDropDownMenuButton> {
  String selectedOption = "";
  final List<String> items = [
    "Tunis",
    "Sousse",
    "Monastir",
    "Sfax",
    "Nabeul",
    "Bizerte",
    "Gabes",
    "Kairouan",
    "Gafsa",
    "Ariana",
    "Kasserine",
    "Ben Arous",
    "Medenine",
    "Tataouine",
    "Manouba",
    "Mahdia",
    "Jendouba",
    "Sidi Bouzid",
    "Siliana",
    "Le Kef",
    "Kebili",
    "Tozeur",
    "Beja",
    "Zaghouan",
  ];
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      radius: const Radius.circular(12),
      child: TypeAheadField<String>(
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            labelText: 'Trouver votre destination',
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
          return items.where(
              (item) => item.toLowerCase().contains(pattern.toLowerCase()));
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
            selectedOption = suggestion;
          });
        },
      ),
    );
  }
}
