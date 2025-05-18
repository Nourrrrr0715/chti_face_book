import 'package:flutter/material.dart';
import '../modeles/membre.dart';

class Avatar extends StatelessWidget {
  final Membre membre;
  final double radius;

  const Avatar({Key? key, required this.membre, this.radius = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: membre.avatarUrl != null && membre.avatarUrl!.isNotEmpty
          ? NetworkImage(membre.avatarUrl!)
          : null,
      child: (membre.avatarUrl == null || membre.avatarUrl!.isEmpty)
          ? Text(membre.nom[0].toUpperCase())
          : null,
    );
  }
}