import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  const GameButton({
    required this.icon,
    required this.label,
    this.description,
    required this.onPressed,
    this.isDisabled = false,
  });

  final IconData icon;
  final String label;
  final String? description;
  final bool isDisabled;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: isDisabled ? null : onPressed,
        icon: Icon(icon),
        label: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            if (description != null) const SizedBox(height: 5),
            if (description != null) Text(description!),
          ],
        ),
      ),
    );
  }
}
