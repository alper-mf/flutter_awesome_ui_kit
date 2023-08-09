import 'dart:math';

import 'package:flutter/material.dart';
import '../button/button_builder/awesome_button_builder.dart';
import '../button/button_builder/model/button_options_model.dart';
import 'package:intl/intl.dart';

class SelectableDatePickerButton extends StatelessWidget {
  final bool? isSelected;
  final bool? disabled;
  final Icon? iconWidget;
  final Color? color;
  final Color? shadowColor;
  final double? radius;

  final String date;
  final double? borderWidth;
  final Function(bool)? onPressed;

  const SelectableDatePickerButton({
    Key? key,
    this.isSelected,
    this.iconWidget,
    this.color,
    this.radius,
    this.borderWidth,
    this.onPressed,
    this.disabled,
    required this.date,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parsedDate = DateTime.parse(date);
    final dayName = DateFormat('EEE').format(parsedDate).toUpperCase();

    final buttonOptions = ButtonOptions(
      text: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
        child: Column(
          children: [
            Text(
              dayName,
              style: TextStyle(
                color: (disabled != null && disabled == true) || (isSelected != null && isSelected != true)
                    ? Colors.black45
                    : null,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              '${parsedDate.day}',
              style: TextStyle(
                color: (disabled != null && disabled == true) || (isSelected != null && isSelected != true)
                    ? Colors.black38
                    : null,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        if ((disabled != null && disabled != true)) {
          onPressed!(isSelected ?? false);
        }
      },
      radius: radius ?? (isSelected == false ? 30 : 100),
      color: disabled == true
          ? const Color.fromRGBO(154, 153, 157, 100)
          : (isSelected == false ? Colors.black12 : Theme.of(context).primaryColor),
      loading: false,
      outline: !(isSelected ?? true),
      disabled: disabled,
      shadowColor: shadowColor ?? Theme.of(context).primaryColor,
      elevation: (isSelected != null && isSelected == true) ? 20 : 0,
      borderWidth: borderWidth ?? 3,
    );

    return AwesomeButtonBuilder().fromOptions(buttonOptions).buildElevatedButton();
  }
}
