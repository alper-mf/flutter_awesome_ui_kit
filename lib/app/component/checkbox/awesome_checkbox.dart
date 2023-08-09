import 'package:flutter/material.dart';

class AwesomeCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final TextStyle? textStyle;

  const AwesomeCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.textStyle,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AwesomeCheckBoxState createState() => _AwesomeCheckBoxState();
}

class _AwesomeCheckBoxState extends State<AwesomeCheckBox> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color borderColor = theme.primaryColor;
    const double boxSize = 24.0;
    const double iconSize = 18.0;
    const double spacing = 8.0;
    const double borderWidth = 1.5;
    const double borderRadius = 4.0;

    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: boxSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                  width: borderWidth,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: widget.value
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).primaryColor,
                      size: iconSize,
                    )
                  : null,
            ),
          ),
          if (widget.label != null) ...[
            const SizedBox(width: spacing),
            Text(widget.label!, style: widget.textStyle ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w200)),
          ]
        ],
      ),
    );
  }
}
