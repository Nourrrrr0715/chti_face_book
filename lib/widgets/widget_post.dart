import 'package:chti_face_bouc/modeles/post.dart';
import 'package:chti_face_bouc/pages/page_detail_post.dart';
import 'package:chti_face_bouc/services_firebase/service_firestore.dart';
import 'package:flutter/material.dart';

class WidgetPost extends StatelessWidget {
  final Post post;
  const WidgetPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(post.text),
            // WidgetContenuPost(post: post),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // ServiceFirestore().addLike(
                    //   memberID: FirebaseAuth.instance.currentUser!.uid,
                    //   post: post,
                    // );
                  },
                  icon: Icon(
                    Icons.star,
                    color:
                        // post.likes.contains(ServiceAuthentification().myId!)
                        // ?
                        // Colors.amber,
                        // :
                        Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text('${post.likes.length} Likes'),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageDetailPost(post: post),
                      ),
                    );
                  },
                  icon: const Icon(Icons.messenger),
                ),
                // FutureBuilder<dynamic>(
                //   future: ServiceFirestore().postComment(post.id),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return const Text("...");
                //     } else if (snapshot.hasError) {
                //       return const Text("Erreur");
                //     } else {
                //       return Text('${snapshot.data} Commentaires');
                //     }
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
