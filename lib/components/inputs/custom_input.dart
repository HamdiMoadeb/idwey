import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInput extends StatefulWidget {
  const CustomInput(
      {this.inputState,
      this.obscureText,
      this.focusNode,
      this.hintText,
      this.controller,
      this.background,
      this.minLines = 1,
      this.maxLines = 1,
      this.onChange,
      this.onSubmit,
      this.inputAction,
      this.inputType,
      required this.enabled,
      this.onTap,
      this.readOnly,
      this.inputFormatters,
      this.maxLength,
      this.autoFocus,
      this.labelText,
      this.textCapitalization,
      this.contentPadding,
      this.textHintColor,
      this.prefixIconName,
      this.suffixIconName,
      this.textColor,
      this.prefix,
      this.suffix,
      this.errorText,
      this.keyboardType,
      required this.foregroundColor,
      this.initialValue,
      Key? key})
      : super(key: key);
  final InputStateModel? inputState;
  final Color? textColor;
  final Color? textHintColor;
  final String? prefixIconName;
  final String? suffixIconName;
  final bool? obscureText, readOnly;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Color? background;
  final int minLines, maxLines;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool? autoFocus;
  final String? labelText;
  final String? errorText;
  final bool? textCapitalization;
  final bool? contentPadding;
  final Color foregroundColor;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final String? initialValue;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late FocusNode _focus;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _focus = widget.focusNode ?? FocusNode();

    _controller = widget.controller ??
        (widget.initialValue != null
            ? TextEditingController(text: widget.initialValue)
            : TextEditingController());

    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    if (widget.controller == null) {
      _controller?.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update the controller when the widget's controller or initialValue changes
    if (widget.controller != oldWidget.controller ||
        widget.initialValue != oldWidget.initialValue) {
      _controller = widget.controller ??
          (widget.initialValue != null
              ? TextEditingController(text: widget.initialValue)
              : TextEditingController());
    }
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color errorColor = Colors.red;
    Color focusColor = Colors.black;
    Color disabledColor = Theme.of(context).disabledColor;
    Color regularStateColor =

        //TODO : check controller value not empty and remain focus Color
        (_focus.hasFocus) ? focusColor : widget.foregroundColor;

    return TextFormField(
        textCapitalization: (widget.textCapitalization == true
            ? TextCapitalization.words
            : TextCapitalization.none),
        focusNode: _focus,
        controller: _controller,
        obscureText: widget.obscureText ?? false,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onSubmit,
        textInputAction: widget.inputAction ?? TextInputAction.done,
        style: (widget.textColor != null || widget.enabled == false)
            ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: widget.enabled ? widget.textColor : disabledColor)
            : Theme.of(context).textTheme.bodyLarge,
        keyboardType: widget.keyboardType,
        enabled: widget.enabled,
        onTap: widget.onTap,
        readOnly: widget.readOnly ?? false,
        inputFormatters: widget.inputFormatters,
        autofocus: widget.autoFocus ?? false,
        decoration: InputDecoration(
            prefixIcon: (widget.prefix != null && widget.prefixIconName == null)
                ? widget.prefix
                : (widget.prefixIconName != null
                    ? _buildPrefix(
                        widget.enabled ? regularStateColor : disabledColor)
                    : null),
            suffixIcon: (widget.suffix != null && widget.suffixIconName == null)
                ? widget.suffix
                : (widget.suffixIconName != null
                    ? _buildSuffix(
                        widget.enabled ? regularStateColor : disabledColor)
                    : null),
            label: _buildLabel(),
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: regularStateColor,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: errorColor,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: errorColor,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            hintText: widget.hintText ?? '',
            errorText: widget.errorText ?? widget.inputState?.message,
            labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: widget.enabled
                    ? (widget.errorText != null &&
                            (_focus.hasFocus || _controller?.text != null)
                        ? errorColor
                        : regularStateColor)
                    : disabledColor),
            errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: widget.errorText != null ? errorColor : null)));
  }

  Widget? _buildPrefix(Color color) {
    return widget.prefixIconName != null
        ? SvgPicture.asset(widget.prefixIconName!,
            fit: BoxFit.scaleDown, height: 24, width: 24, color: color)
        : null;
  }

  Widget? _buildSuffix(Color color) {
    return widget.suffixIconName != null
        ? SvgPicture.asset(widget.suffixIconName!,
            fit: BoxFit.scaleDown, height: 24, width: 24, color: color)
        : null;
  }

  Widget? _buildLabel() {
    return widget.labelText != null ? Text(widget.labelText ?? '') : null;
  }
}

class InputStateModel {
  InputStateModel({required this.message, required this.state});

  /// Type of [String] , it defines the message to display under the input
  final String message;

  /// Type of [InputState] , it defines the state of the input. i.e, success, warning, error.
  final InputState state;
}

enum InputType { regular, date, time, search, code, multiLines }

enum InputState { success, warning, error }
