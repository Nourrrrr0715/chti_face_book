import 'package:chti_face_bouc/widgets/liste_commentaire.dart';
import 'package:flutter/material.dart';
import '../modeles/post.dart';

/// Page affichant les détails d'un post.
/// À appeler via Navigator.pushNamed(context, PageDetailPost.routeName, arguments: post);
class PageDetailPost extends StatefulWidget {
  final Post post;
  const PageDetailPost({super.key, required this.post});

  @override
  State<PageDetailPost> createState() => _PageDetailPostState();
}

class _PageDetailPostState extends State<PageDetailPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail du post'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.post.image != null && widget.post.image!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(widget.post.image!),
              ),
            const SizedBox(height: 16),
            Text(
              widget.post.text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              widget.post.text,
              style: Theme.of(context).textTheme.bodyMedium
            ),
            const SizedBox(height: 24),
            Text(
              'Commentaires',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            ListeCommentaire(commentaires: widget.post),
          ],
        ),
      ),
    );
  }
}
