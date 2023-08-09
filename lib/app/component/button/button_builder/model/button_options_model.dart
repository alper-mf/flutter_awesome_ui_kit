import 'package:flutter/material.dart';

class ButtonOptions {
  final Key? key;
  final Widget? text;
  final Widget? icon;
  final Widget? loadingWidget;
  final bool? loading;
  final bool? outline;
  final bool? disabled;
  final Color? color;
  final double? radius;
  final double? borderWidth;
  final Function()? onPressed;

  ButtonOptions({
    this.color,
    this.disabled,
    this.radius,
    this.borderWidth,
    this.key,
    this.text,
    this.icon,
    this.loading,
    this.loadingWidget,
    this.outline,
    this.onPressed,
  });
}
