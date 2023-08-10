import 'package:flutter/material.dart';

class AwesomeSelectableCircleAvatar extends StatefulWidget {
  final List<String> avatarUrls;
  final ValueChanged<int> onAvatarSelected;

  const AwesomeSelectableCircleAvatar({
    super.key,
    required this.avatarUrls,
    required this.onAvatarSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SelectableCircleAvatarState createState() => _SelectableCircleAvatarState();
}

class _SelectableCircleAvatarState extends State<AwesomeSelectableCircleAvatar> {
  int _selectedAvatarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.avatarUrls.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedAvatarIndex = index;
                    widget.onAvatarSelected(index);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _selectedAvatarIndex == index ? Colors.blue : Colors.grey,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(widget.avatarUrls[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
