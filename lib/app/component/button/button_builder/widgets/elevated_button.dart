part of '../awesome_button_builder.dart';

class _ElevatedButton extends _ButtonWidget {
  const _ElevatedButton({
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
  }) : super(
          key: key,
          text: text,
          icon: icon,
          color: color,
          outline: outline,
          disabled: disabled,
          loading: loading,
          radius: radius,
          borderWidth: borderWidth,
          onPressed: onPressed,
          loadingWidget: loadingWidget,
        );
  @override
  @override
  Widget build(BuildContext context) {
    final buttonStyle = _outline
        ? ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: _loading
                ? Colors.grey.shade400
                : _disabled
                    ? const Color.fromRGBO(154, 153, 157, 100) // Disabled durumunda yeni arkaplan rengi
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
            elevation: 0,
            backgroundColor: _loading
                ? const Color.fromRGBO(154, 153, 157, 100)
                : _disabled
                    ? const Color(0xFF9A999D) // Disabled durumunda yeni arkaplan rengi
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
