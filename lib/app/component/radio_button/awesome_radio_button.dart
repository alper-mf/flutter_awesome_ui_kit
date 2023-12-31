import 'package:flutter/material.dart';

class AwesomeRadioButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final TextStyle? textStyle;

  const AwesomeRadioButton({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.textStyle,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AwesomeRadioButtonState createState() => _AwesomeRadioButtonState();
}

class _AwesomeRadioButtonState extends State<AwesomeRadioButton> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    const double circleSize = 22.0;
    const double circleBorderWidth = 2.0;
    const double innerCircleSize = 10.0;
    const spacing = 8.0;

    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: circleSize,
            height: circleSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor,
                  width: circleBorderWidth,
                ),
              ),
              child: widget.value
                  ? Center(
                      child: SizedBox(
                        width: innerCircleSize,
                        height: innerCircleSize,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                        ),
                      ),
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
