import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';

class ExpandableDescription extends StatefulWidget {
  const ExpandableDescription({
    Key? key,
    required this.description,
    this.readMoreLabel,
    this.readLessLabel,
    this.maxLines = 1,
    this.isExpandable = true,
    this.padding,
    this.bodyColor,
    this.buttonColor = Colors.grey,
  }) : super(key: key);

  final String description;
  final String? readMoreLabel;
  final String? readLessLabel;
  final int? maxLines;
  final bool isExpandable;
  final EdgeInsetsGeometry? padding;
  final Color buttonColor;
  final Color? bodyColor;

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool isReadMore = false;

  final GlobalKey _widgetKey = GlobalKey();
  double maxDescriptionWidth = 100;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_getWidgetInfo);
  }

  void _getWidgetInfo(_) {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;
    _widgetKey.currentContext?.size;
    final Size size = renderBox.size;

    setState(() {
      maxDescriptionWidth = size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    final span = TextSpan(
        text: parse(widget.description).body?.text,
        style: Theme.of(context).textTheme.bodySmall);
    final tp = TextPainter(
        text: span,
        maxLines: widget.maxLines,
        textDirection: TextDirection.ltr);
    tp.layout(maxWidth: maxDescriptionWidth);
    final lines = (isReadMore || !widget.isExpandable || !tp.didExceedMaxLines)
        ? null
        : widget.maxLines;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: widget.padding,
            child: Html(
              key: _widgetKey,
              data: widget.description,
              style: {
                "body": Style(
                  maxLines: lines,
                  //  margin: EdgeInsets.zero,
                  //padding: EdgeInsets.zero,
                  color: widget.bodyColor,
                  fontSize: FontSize(
                      Theme.of(context).textTheme.bodySmall?.fontSize ?? 14),
                  fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                  fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
                ),
              },
            )),
        (widget.isExpandable && tp.didExceedMaxLines)
            ? getReadMoreButton()
            : const SizedBox.shrink()
      ],
    );
  }

  Widget getReadMoreButton() {
    return InkWell(
      onTap: () {
        setState(() {
          isReadMore = !isReadMore;
        });
      },
      child: Text(
          !isReadMore
              ? widget.readMoreLabel ?? "Read More"
              : widget.readLessLabel ?? "Read Less",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          )),
    );
  }
}
