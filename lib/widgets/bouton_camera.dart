import 'package:flutter/material.dart';

class BoutonCamera extends StatelessWidget {
  final VoidCallback onTap;

  const BoutonCamera({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.camera_alt),
      tooltip: 'Changer la photo',
      onPressed: onTap,
    );
  }
}
