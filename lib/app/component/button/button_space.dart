import 'package:flutter/material.dart';

import 'button_builder/awesome_button_builder.dart';
import 'button_builder/model/button_options_model.dart';

enum ButtonType { outlined, soft }

class ButtonSpace extends StatelessWidget {
  final ButtonType? buttonType;
  final Widget? textWidget;
  final Icon? iconWidget;
  final Color? color;
  final double? radius;
  final String? text;
  final bool? loading, disabled;
  final double? borderWidth;
  final Function()? onPressed;

  const ButtonSpace({
    Key? key,
    this.buttonType,
    this.textWidget,
    this.iconWidget,
    this.color,
    this.radius,
    this.text,
    this.loading,
    this.borderWidth,
    this.onPressed,
    this.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonOptions options = buttonType == ButtonType.outlined
        ? ButtonOptions(
            text: Row(
              children: [
                if (iconWidget != null) ...[
                  iconWidget!,
                  const SizedBox(width: 10),
                ],
                textWidget ??
                    Text(
                      text ?? 'Elevated Outline Button',
                      style: TextStyle(
                          color: disabled != null && disabled == true ? Colors.black38 : Theme.of(context).primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
              ],
            ),
            onPressed: onPressed,
            radius: radius ?? 30,
            color: Theme.of(context).primaryColor,
            loading: loading ?? true,
            borderWidth: borderWidth ?? 1,
            icon: iconWidget,
            disabled: disabled ?? false,
            outline: true,
          )
        : buttonType == ButtonType.soft
            ? ButtonOptions(
                text: Text(
                  text ?? 'Awesome Loading Button',
                  style: TextStyle(
                    color: disabled != (disabled ?? false) ? Colors.black : Colors.black38,
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),
                ),
                icon: iconWidget,
                onPressed: onPressed,
                radius: radius ?? 30,
                color: const Color(0xFFF1F8FE),
                loading: loading ?? false,
                disabled: disabled ?? false,
              )
            : ButtonOptions(
                icon: iconWidget,
                text: textWidget ??
                    Text(
                      text ?? 'Elevated Button',
                      style: TextStyle(
                        color: disabled != null && disabled == true ? Colors.black38 : Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                onPressed: onPressed,
                radius: radius ?? 30,
                color: Theme.of(context).primaryColor,
                loading: loading ?? false,
                outline: false,
                disabled: disabled ?? false,
              );

    return buttonType == ButtonType.outlined
        ? AwesomeButtonBuilder().fromOptions(options).buildOutlinedButton()
        : AwesomeButtonBuilder().fromOptions(options).buildElevatedButton();
  }
}
