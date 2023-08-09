part of '../awesome_button_builder.dart';

class _OutlinedButton extends _ButtonWidget {
  const _OutlinedButton({
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
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: key,
      onPressed: !_disabled ? _onPressed : null,
      style: OutlinedButton.styleFrom(
        elevation: _elevation,
        shadowColor: _shadowColor,
        backgroundColor: _disabled
            ? Colors.grey.shade400
            : _loading
                ? Theme.of(context).primaryColor.withOpacity(0.2)
                : Colors.white, // Doğru renkleri burada kontrol edin
        side: BorderSide(
            color: _disabled
                ? Colors.grey.shade500
                : _loading
                    ? Theme.of(context).primaryColor.withOpacity(0.2)
                    : _color,
            width: _borderWidth),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius)),
      ),
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_icon, _text],
              ),
      ),
    );
  }
}
