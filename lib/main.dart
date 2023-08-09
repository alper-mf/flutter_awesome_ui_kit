import 'package:drh_app_components/app/component/button/button_space.dart';
import 'package:drh_app_components/app/component/selectable_chip_button/selectable_chip_button.dart';
import 'package:drh_app_components/app/component/selectable_date_picker_button/selectable_date_picker_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Buttons'),
            const SizedBox(height: 20),
            const ButtonSpace(
              buttonType: ButtonType.soft,
              text: 'Awesome Button',
            ),
            const SizedBox(height: 20),
            const ButtonSpace(
              buttonType: ButtonType.outlined,
              text: 'Elevated Outline Button',
              loading: false,
            ),
            const SizedBox(height: 20),
            const ButtonSpace(
              buttonType: ButtonType.outlined,
              text: 'Elevated Outline Button',
              loading: false,
              disabled: true,
            ),
            const SizedBox(height: 20),
            const ButtonSpace(
              text: 'Elevated Button',
              loading: false,
              disabled: false,
            ),
            const SizedBox(height: 20),
            const ButtonSpace(
              text: 'Elevated Button (Disabled)',
              loading: false,
              disabled: true,
            ),
            const SizedBox(height: 20),
            const ButtonSpace(
              iconWidget: Icon(
                Icons.calendar_month,
                size: 16,
              ),
              loading: false,
              disabled: false,
            ),
            const SizedBox(height: 20),
            const ButtonSpace(
              iconWidget: Icon(
                Icons.calendar_month,
                size: 16,
              ),
              loading: false,
              disabled: true,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableChipButton(
                  text: '01:00',
                  onPressed: (val) {
                    setState(() {
                      isSelected = !val;
                    });
                  },
                  isSelected: true,
                  disabled: false,
                ),
                const SizedBox(width: 10),
                SelectableChipButton(
                  text: '01:00',
                  onPressed: (val) {
                    setState(() {
                      isSelected = !val;
                    });
                  },
                  isSelected: isSelected,
                  disabled: false,
                ),
                const SizedBox(width: 10),
                SelectableChipButton(
                  text: '01:00',
                  onPressed: (val) {
                    setState(() {
                      isSelected = !val;
                    });
                  },
                  isSelected: isSelected,
                  disabled: true,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableDatePickerButton(
                  date: '2023-08-08T19:05:08.352+00:00',
                ),
                SizedBox(width: 10),
                SelectableDatePickerButton(
                  date: '2023-08-08T19:05:08.352+00:00',
                  isSelected: false,
                ),
                SizedBox(width: 10),
                SelectableDatePickerButton(
                  date: '2023-08-08T19:05:08.352+00:00',
                  disabled: true,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}