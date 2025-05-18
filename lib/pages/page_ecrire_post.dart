import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../services_firebase/service_firestore.dart';
import '../services_firebase/service_storage.dart';

class PageEcrirePost extends StatefulWidget {
  const PageEcrirePost({super.key});

  @override
  State<PageEcrirePost> createState() => _PageEcrirePostState();
}

class _PageEcrirePostState extends State<PageEcrirePost> {
  final TextEditingController textController = TextEditingController();
  File? selectedImage;

  Future<void> takePic(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 50);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _sendPost() async {
    final texte = textController.text.trim();
    if (texte.isEmpty || selectedImage == null) return;

    // 1. Upload image
    final imageUrl = await ServiceStorage().uploadImage(selectedImage!);

    // 2. Envoyer dans Firestore
    await ServiceFirestore().createPost(texte: texte, imageUrl: imageUrl);

    // 3. Retour à l’accueil
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Écrire un post")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.border_color),
                        SizedBox(width: 8),
                        Text("Écrire un post"),
                      ],
                    ),
                    const Divider(),
                    TextField(
                      controller: textController,
                      maxLines: null,
                      decoration: const InputDecoration(hintText: "Exprime-toi !"),
                    ),
                    const SizedBox(height: 12),
                    if (selectedImage != null)
                      Image.file(selectedImage!, height: 150),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.photo),
                          onPressed: () => takePic(ImageSource.gallery),
                        ),
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () => takePic(ImageSource.camera),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendPost,
              child: const Text("Envoyer"),
            ),
          ],
        ),
      ),
    );
  }
}
