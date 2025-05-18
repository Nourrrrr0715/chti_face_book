import 'package:flutter/material.dart';

class WidgetVide extends StatelessWidget {
  const WidgetVide({super.key, this.titre = 'En cours...'});

  final String titre;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(titre));
  }
}
