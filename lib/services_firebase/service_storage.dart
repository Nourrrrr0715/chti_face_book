import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart' as uuid;

class ServiceStorage {
  final storageRef = FirebaseStorage.instance.ref();

  Future<String> uploadImage(File file) async {
    final fileName = const uuid.Uuid().v4();
    final ref = storageRef.child("images/$fileName.jpg");
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

}
