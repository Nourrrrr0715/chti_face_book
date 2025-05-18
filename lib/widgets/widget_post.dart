import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const PostWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final texte = data['texte'] ?? '';
    final image = data['image'] ?? '';
    final auteur = "${data['prenom'] ?? ''} ${data['nom'] ?? ''}";
    final nbLikes = data['likes'] ?? 0;

    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(auteur, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (texte != '') Text(texte),
            if (image != '')
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Image.network(image),
              ),
            const SizedBox(height: 10),
            Text("👍 $nbLikes", style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
