import 'package:cloud_firestore/cloud_firestore.dart';
import '../modeles/constantes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServiceFirestore {
  final _db = FirebaseFirestore.instance;

  addMember({required String id, required Map<String, dynamic> data}) {
    _db.collection('members').doc(id).set(data);
  }

  specificMember(String memberId) {
    return _db.collection('members').doc(memberId).snapshots();
  }

  // Future<void> updateMember(Membre membre) async {
  //   await _db
  //       .collection(ConstCollection.membres)
  //       .doc(membre.id)
  //       .update(membre.toMap());
  // }

  Stream<QuerySnapshot> allPosts() {
    return _db
        .collection('posts')
        .orderBy('date', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> postForMember(String id) {
    return _db
        .collection('posts')
        .where('auteurId', isEqualTo: id)
        .orderBy('date', descending: true)
        .snapshots();
  }

  Future<void> createPost({
    required String texte,
    required String imageUrl,
  }) async {
    await FirebaseFirestore.instance.collection('posts').add({
      'texte': texte,
      'imageUrl': imageUrl,
      'date': Timestamp.now(),
      'likes': 0,
      'auteur': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  Future<void> addPost(String content, {String? imageUrl}) {
    final posts = FirebaseFirestore.instance.collection('posts');
    return posts.add({
      'content': content,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  postComment(String postId) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection(commentCollectionKey)
        .orderBy(dateKey, descending: true)
        .snapshots();
  }
}
