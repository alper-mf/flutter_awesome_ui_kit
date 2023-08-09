import 'package:flutter/material.dart';

class AwesomeRadioButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AwesomeRadioButton({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AwesomeRadioButtonState createState() => _AwesomeRadioButtonState();
}

class _AwesomeRadioButtonState extends State<AwesomeRadioButton> {
  static const double circleSize = 22.0;
  static const double circleBorderWidth = 2.0;
  static const double innerCircleSize = 10.0;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: SizedBox(
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
    );
  }
}
