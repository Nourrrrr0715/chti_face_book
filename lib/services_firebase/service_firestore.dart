import 'package:cloud_firestore/cloud_firestore.dart';
import '../modeles/membre.dart';
import '../modeles/constantes.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ServiceFirestore {
  final _db = FirebaseFirestore.instance;


  
  Future<void> addMember(Membre membre) async {
    await _db.collection(ConstCollection.membres).doc(membre.id).set(membre.toMap());
  }

  Future<void> updateMember(Membre membre) async {
    await _db.collection(ConstCollection.membres).doc(membre.id).update(membre.toMap());
  }

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

  Future<void> createPost({required String texte, required String imageUrl}) async {
  await FirebaseFirestore.instance.collection('posts').add({
    'texte': texte,
    'imageUrl': imageUrl,
    'date': Timestamp.now(),
    'likes': 0,
    'auteur': FirebaseAuth.instance.currentUser!.uid,
  });
}
}

Future<void> addPost(String content, {String? imageUrl}) {
  final posts = FirebaseFirestore.instance.collection('posts');
  return posts.add({
    'content': content,
    'imageUrl': imageUrl,
    'createdAt': FieldValue.serverTimestamp(),
  });
}

  Stream<QuerySnapshot> postForMember(String id) {
  return FirebaseFirestore.instance
      .collection('posts')
      .where('auteurId', isEqualTo: id)
      .orderBy('date', descending: true)
      .snapshots();
}

postComment(String postId) {
    return firestorePost
        .doc(postId)
        .collection(commentCollectionKey)
        .orderBy(dateKey, descending: true)
        .snapshots();
  } 
