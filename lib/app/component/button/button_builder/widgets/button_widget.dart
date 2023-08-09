part of '../awesome_button_builder.dart';

abstract class _ButtonWidget extends StatelessWidget {
  final Widget _text;
  final Widget _icon;
  final Color _color;
  final bool _outline;
  final bool _disabled;
  final bool _loading;
  final double _radius;
  final double _borderWidth;
  final Function()? _onPressed;
  final Widget? _loadingWidget;
  const _ButtonWidget({
    Key? key,
    required Widget text,
    required Widget icon,
    required Color color,
    required bool outline,
    required bool disabled,
    required bool loading,
    required double radius,
    required double borderWidth,
    required Function()? onPressed,
    required Widget? loadingWidget,
  })  : _text = text,
        _icon = icon,
        _color = color,
        _outline = outline,
        _disabled = disabled,
        _loading = loading,
        _radius = radius,
        _borderWidth = borderWidth,
        _onPressed = onPressed,
        _loadingWidget = loadingWidget,
        super(key: key);

  @override
  Widget build(BuildContext context);
}
