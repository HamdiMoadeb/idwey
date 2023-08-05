import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/theme/app_colors.dart';

class FilterItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final Function(bool) onTap;

  const FilterItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected ? primaryOrange : Colors.grey[300];

    return GestureDetector(
      onTap: () => onTap(!isSelected),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          // margin: const EdgeInsets.all(4),
          width: 120,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: isSelected
                ? kLinearGradient
                : LinearGradient(colors: [
                    Colors.grey[300]!,
                    Colors.grey[300]!,
                    Colors.grey[300]!,
                  ]),
          ),
          child: Container(
            margin: EdgeInsets.all(isSelected ? 2 : 1),
            width: 120,
            height: 85,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              // Set background color to white for a square container
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isSelected
                    ? Center(
                        child: ShaderMask(
                          blendMode: BlendMode.srcATop,
                          shaderCallback: (Rect bounds) {
                            return kLinearGradient.createShader(bounds);
                          },
                          child: SvgPicture.asset(
                            icon,
                          ),
                        ),
                      )
                    : SvgPicture.asset(
                        icon,
                        color: Colors.grey[300],
                      ),
                const SizedBox(width: 8),
                isSelected
                    ? ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return kLinearGradient.createShader(bounds);
                        },
                        child: Text(label,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[300],
                                    fontSize: 14)),
                      )
                    : Text(label,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[300],
                            fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
