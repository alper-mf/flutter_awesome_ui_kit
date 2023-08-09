import 'dart:math';

import 'package:flutter/material.dart';
import 'model/button_options_model.dart';

part './widgets/button_widget.dart';
part './widgets/elevated_button.dart';
part './widgets/outlined_button.dart';

// A builder class for creating awesome buttons
class AwesomeButtonBuilder {
  Key? _key; // The button key
  Widget? _text; // The button text widget
  Widget? _icon; // The button icon widget
  Color? _color; // The button color
  Color? _shadowColor;

  bool? _outline = false; // Whether the button should be outlined or not
  bool? _disabled = false; // Whether the button is disabled or not
  bool? _loading = false; // Whether the button is in a loading state or not
  double? _radius = 10; // The button border radius
  double? _borderWidth = 2; // The button border width
  double? _elevation = 0; // The button elevation

  Function()? _onPressed; // The callback function when the button is pressed
  Widget? _loadingWidget; // The loading widget to display while the button is loading

  /// Sets options for the button
  AwesomeButtonBuilder fromOptions(ButtonOptions options) {
    _elevation = options.elevation ?? 0;
    _shadowColor = options.shadowColor ?? Colors.black45;
    _key = options.key ?? UniqueKey();
    _text = options.text ?? const SizedBox.shrink();
    _icon = options.icon ?? const SizedBox.shrink();
    _loading = options.loading ?? false;
    _outline = options.outline ?? false;
    _disabled = options.disabled ?? false;
    _color = options.color ?? Colors.blueAccent.shade400;
    _radius = options.radius;
    _borderWidth = options.borderWidth ?? 2;
    _onPressed = options.onPressed ?? () {};
    _loadingWidget = options.loadingWidget ??
        CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(
              options.outline == (options.outline ?? false) ? Colors.white : Colors.black),
          backgroundColor: (options.outline ?? false) ? (_color ?? Colors.black) : Colors.white,
        );

    return this;
  }

  /// Builds an elevated button
  Widget buildElevatedButton() {
    return _ElevatedButton(
      elevation: _elevation!,
      shadowColor: _shadowColor ?? Colors.black45,
      loadingWidget: _loadingWidget!,
      key: _key!,
      onPressed: _onPressed!,
      text: _text!,
      icon: _icon!,
      color: _color ?? const Color(0xFFF1F8FE),
      outline: _outline ?? false,
      disabled: _disabled ?? false,
      loading: _loading ?? false,
      radius: _radius ?? 10,
      borderWidth: _borderWidth!,
    );
  }

  /// Builds an outlined button
  Widget buildOutlinedButton() {
    return _OutlinedButton(
      shadowColor: _shadowColor ?? Colors.black45,
      elevation: _elevation ?? 0,
      borderWidth: _borderWidth!,
      loadingWidget: _loadingWidget!,
      key: _key!,
      onPressed: _onPressed!,
      text: _text!,
      icon: _icon!,
      color: _color!,
      outline: _outline!,
      disabled: _disabled!,
      loading: _loading!,
      radius: _radius!,
    );
  }
}
