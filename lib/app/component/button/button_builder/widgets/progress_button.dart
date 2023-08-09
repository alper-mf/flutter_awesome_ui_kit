import 'dart:async';
import 'package:flutter/material.dart';

import '../model/button_options_model.dart';

class UploadButton extends StatefulWidget {
  final ButtonOptions? buttonOptions;

  const UploadButton({super.key, this.buttonOptions});

  @override
  // ignore: library_private_types_in_public_api
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  double progress = 1.0;
  double? radius;
  bool isStarted = false;
  Color? buttonColor;

  void startUpload() {
    // Simulate file upload
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (progress < 1) {
        setState(() {
          progress += 0.01;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    radius = widget.buttonOptions?.radius ?? 10;
    buttonColor = widget.buttonOptions?.color ?? Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.buttonOptions?.disabled ?? false
          ? null
          : () {
              setState(() {
                progress = 0.0;
                isStarted = true;
              });
              startUpload();
            },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: Colors.blue[50],
        ),
        width: MediaQuery.of(context).size.width - 100,
        height: 56,
        child: Stack(
          children: [
            buildUploadButton(),
            Center(
              child: Text(
                _displayText(),
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUploadButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      width: progress * (MediaQuery.of(context).size.width - 100),
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius!),
          bottomLeft: Radius.circular(radius!),
          topRight: Radius.circular(progress < 1.0 ? 0 : radius!),
          bottomRight: Radius.circular(progress < 1.0 ? 0 : radius!),
        ),
        color: buttonColor,
      ),
      child: const SizedBox.shrink(),
    );
  }

  String _displayText() {
    if (!isStarted && progress == 1.0) {
      return 'Start the upload';
    } else if ((isStarted && progress == 1.0) || (isStarted && progress > 1.0)) {
      return 'Upload Completed';
    } else if (isStarted && progress < 1.0) {
      return 'Uploading %${(progress * 100).toStringAsFixed(0)}';
    } else {
      return 'Upload Successful';
    }
  }
}
