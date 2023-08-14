// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AwesomeSelectableCircleAvatar extends StatefulWidget {
  final List<String> avatarUrls;
  final ValueChanged<List<int>> onAvatarsSelected;
  final double? radius;

  const AwesomeSelectableCircleAvatar({
    Key? key,
    required this.avatarUrls,
    required this.onAvatarsSelected,
    this.radius,
  }) : super(key: key);

  @override
  _SelectableCircleAvatarState createState() => _SelectableCircleAvatarState();
}

class _SelectableCircleAvatarState extends State<AwesomeSelectableCircleAvatar> {
  final List<int> _selectedAvatarIndices = [];

  void _handleAvatarTap(int index) {
    setState(() {
      if (_selectedAvatarIndices.contains(index)) {
        _selectedAvatarIndices.remove(index);
      } else {
        _selectedAvatarIndices.add(index);
      }
      widget.onAvatarsSelected(_selectedAvatarIndices);
    });
  }

  Widget _buildAvatar(int index) {
    final isSelected = _selectedAvatarIndices.contains(index);
    final theme = Theme.of(context);
    final avatarColor = isSelected ? theme.primaryColor.withOpacity(0.2) : theme.scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => _handleAvatarTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: avatarColor,
          border: Border.all(
            color: isSelected ? theme.primaryColor : theme.scaffoldBackgroundColor,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          radius: widget.radius ?? 30,
          backgroundImage: NetworkImage(widget.avatarUrls[index]),
        ),
      ),
    );
  }

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
            _buildAvatar,
          ),
        ),
      ],
    );
  }
}
