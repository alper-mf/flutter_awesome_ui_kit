part of '../awesome_button_builder.dart';

class _ElevatedButton extends _ButtonWidget {
  const _ElevatedButton({
    Key? key,
    required Widget text,
    required Widget icon,
    required Color color,
    required Color shadowColor,
    required bool outline,
    required bool disabled,
    required bool loading,
    required double radius,
    required double borderWidth,
    required double elevation,
    required Function()? onPressed,
    required Widget? loadingWidget,
  }) : super(
          key: key,
          text: text,
          icon: icon,
          color: color,
          shadowColor: shadowColor,
          outline: outline,
          disabled: disabled,
          loading: loading,
          radius: radius,
          borderWidth: borderWidth,
          elevation: elevation,
          onPressed: onPressed,
          loadingWidget: loadingWidget,
        );
  @override
  @override
  Widget build(BuildContext context) {
    final buttonStyle = _outline
        ? ElevatedButton.styleFrom(
            elevation: _elevation,
            shadowColor: _shadowColor,
            foregroundColor: _loading
                ? Colors.grey.shade400
                : _disabled
                    ? Colors.grey.shade400 // Disabled durumunda yeni arkaplan rengi
                    : Colors.white,
            backgroundColor: _disabled
                ? Colors.transparent // Disabled durumunda yeni arkaplan rengi
                : Theme.of(context).scaffoldBackgroundColor,
            side: BorderSide(
              color: _color,
              width: _borderWidth,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius),
            ),
          )
        : OutlinedButton.styleFrom(
            elevation: _elevation,
            shadowColor: _shadowColor,
            backgroundColor: _loading
                ? Colors.grey.shade400
                : _disabled
                    ? Colors.grey.shade400 // Disabled durumunda yeni arkaplan rengi
                    : _color,
            foregroundColor: _disabled ? Colors.white.withOpacity(0.5) : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius),
            ),
          );

    return ElevatedButton(
      key: key,
      onPressed: !_disabled ? _onPressed : null,
      style: buttonStyle,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 0.5,
                end: 1,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: _loading
            ? _loadingWidget
            : Row(
                key: UniqueKey(),
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _icon,
                  if (_icon is Icon) const SizedBox(width: 5),
                  _text,
                ],
              ),
      ),
    );
  }
}
