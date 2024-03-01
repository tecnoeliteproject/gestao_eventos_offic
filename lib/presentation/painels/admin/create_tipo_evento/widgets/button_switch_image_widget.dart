import 'package:flutter/material.dart';

class ButtonSwitchImageWidget extends StatelessWidget {
  const ButtonSwitchImageWidget({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          onPressed: onPressed,
          icon: const Icon(Icons.sync),
        ),
      ),
    );
  }
}
