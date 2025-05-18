import 'package:flutter/material.dart';
import '../modeles/post.dart';
import 'entete_membre.dart';
import 'formatage_date.dart';

class ContenuPost extends StatelessWidget {
  final Post post;

  const ContenuPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EnteteMembre(membre: post.auteur, date: post.datePublication),
          if (post.imageUrl != null && post.imageUrl!.isNotEmpty)
            Image.network(post.imageUrl!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.contenu),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: FormatageDate(date: post.datePublication),
          ),
        ],
      ),
    );
  }
}