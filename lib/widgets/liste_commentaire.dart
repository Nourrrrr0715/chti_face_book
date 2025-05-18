import 'package:flutter/material.dart';
import '../modeles/post.dart';
import 'widget_commentaire.dart';

class ListeCommentaire extends StatelessWidget {
  final List<Comment> commentaires;

  const ListeCommentaire({Key? key, required this.commentaires}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (commentaires.isEmpty) {
      return Center(child: Text('Aucun commentaire'));
    }
    return Column(
      children: commentaires.map((c) => WidgetCommentaire(comment: c)).toList(),
    );
  }
}