import 'dart:io';

import 'package:chti_face_bouc/modeles/membre.dart';
import 'package:chti_face_bouc/services_firebase/service_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../modeles/constantes.dart';

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

  allPosts() {
    return _db
        .collection('posts')
        .orderBy(dateKey, descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> postForMember(String id) {
    return _db
        .collection('posts')
        .where('auteurId', isEqualTo: id)
        .orderBy('date', descending: true)
        .snapshots();
  }

  createPost({
    required Membre member,
    required String text,
    required XFile? image,
  }) async {
    final date = DateTime.now().millisecondsSinceEpoch;

    Map<String, dynamic> map = {
      memberIdKey: member.id,
      likesKey: [],
      dateKey: date,
      textKey: text,
    };

    if (image != null) {
      final url = await ServiceStorage().addImage(
        file: File(image.path),
        folder: postCollectionKey,
        userId: member.id,
        imageName: date.toString(),
      );
      map[postImageKey] = url;
    }

    await _db.collection('posts').doc().set(map);
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
