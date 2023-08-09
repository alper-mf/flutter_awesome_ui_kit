import 'package:flutter/material.dart';

import '../button/button_builder/awesome_button_builder.dart';
import '../button/button_builder/model/button_options_model.dart';

class SelectableChipButton extends StatelessWidget {
  final bool? isSelected;
  final bool? disabled;
  final Widget? textWidget;
  final Icon? iconWidget;
  final Color? color;
  final double? radius;
  final String? text;
  final double? borderWidth;
  final Function(bool)? onPressed;

  const SelectableChipButton({
    Key? key,
    this.isSelected,
    this.textWidget,
    this.iconWidget,
    this.color,
    this.radius,
    this.text,
    this.borderWidth,
    this.onPressed,
    this.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonOptions options = isSelected == false
        ? ButtonOptions(
            text: textWidget ??
                Text(
                  text ?? 'Not Selected Chip',
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12, fontWeight: FontWeight.w300),
                ),
            onPressed: () {
              onPressed!(isSelected ?? false);
            },
            radius: radius ?? 30,
            color: Theme.of(context).primaryColor,
            loading: false,
            borderWidth: borderWidth ?? 1,
            outline: true,
          )
        : ButtonOptions(
            text: Text(
              text ?? 'Selected Chip',
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              onPressed!(isSelected ?? false);
            },
            radius: radius ?? 30,
            color: Theme.of(context).primaryColor,
            loading: false,
          );

    final disabledStyle = ButtonOptions(
      text: textWidget ??
          Text(
            text ?? 'Disabled Chip Button',
            style: TextStyle(
                color: disabled != (disabled ?? false) ? Colors.white : Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w300),
          ),
      onPressed: () {
        return;
      },
      radius: radius ?? 30,
      disabled: true,
      loading: false,
      color: const Color.fromRGBO(154, 153, 157, 100),
      outline: false,
    );

    final style = disabled == true ? disabledStyle : options;

    return AwesomeButtonBuilder().fromOptions(style).buildElevatedButton();
  }
}
