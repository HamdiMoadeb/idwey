import 'package:flutter/material.dart';
import 'package:idwey/components/buttons/type.dart';
import 'package:idwey/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  /// Type of [VoidCallback], the callback that is called when the button is pressed
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// Type of [String], defines the button's text
  final Widget child;

  /// Type of [ButtonType], defines the button's type. i.e, outlined, filled or text
  final ButtonType buttonType;

  const CustomButton.primary({
    Key? key,
    this.onPressed,
    required this.child,
  })  : buttonType = ButtonType.primary,
        super(key: key);

  const CustomButton.secondaryColor({
    Key? key,
    this.onPressed,
    required this.child,
  })  : buttonType = ButtonType.secondaryColor,
        super(key: key);

  const CustomButton.textOnly({
    Key? key,
    this.onPressed,
    required this.child,
  })  : buttonType = ButtonType.textOnly,
        super(key: key);

  const CustomButton.secondaryGrey({
    Key? key,
    this.onPressed,
    required this.child,
  })  : buttonType = ButtonType.secondaryGrey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.primary:
        return ElevatedButton(
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0),
        );

      case ButtonType.secondaryColor:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: const BorderSide(color: materialPrimary),
            elevation: 0,
          ),
          child: child,
        );
      case ButtonType.textOnly:
        return TextButton(
          onPressed: onPressed,
          child: child,
        );
      case ButtonType.secondaryGrey:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: const Color(0XFFFAFAFA)),
          onPressed: onPressed,
          child: child,
        );
      default:
        return ElevatedButton(
          onPressed: onPressed,
          child: child,
        );
    }
  }
}
