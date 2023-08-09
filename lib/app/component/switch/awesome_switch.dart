import 'package:flutter/material.dart';

class AwesomeSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AwesomeSwitch({super.key, required this.value, required this.onChanged});

  @override
  // ignore: library_private_types_in_public_api
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<AwesomeSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: SizedBox(
        width: 50,
        height: 28,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.value ? Colors.blue : Colors.grey.shade400,
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                top: 2,
                left: widget.value ? 22 : 0,
                right: widget.value ? 0 : 22,
                child: SizedBox(
                  width: 26,
                  height: 24,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.value ? Colors.white : Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
