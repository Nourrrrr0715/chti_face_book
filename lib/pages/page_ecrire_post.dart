import 'package:chti_face_bouc/modeles/membre.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../services_firebase/service_firestore.dart';

class PageEcrirePost extends StatefulWidget {
  final Membre member;
  const PageEcrirePost({super.key, required this.member});

  @override
  State<PageEcrirePost> createState() => _PageEcrirePostState();
}

class _PageEcrirePostState extends State<PageEcrirePost> {
  final TextEditingController textController = TextEditingController();
  XFile? selectedImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Future<void> takePic(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(
      source: source,
      maxWidth: 800,
    );
    if (image != null) {
      setState(() {
        selectedImage = XFile(image.path);
      });
    }
  }

  void envoyerPost() async {
    final texte = textController.text.trim();
    FocusScope.of(context).requestFocus(FocusNode());

    if (texte.isEmpty && selectedImage == null) return;

    try {
      await ServiceFirestore().createPost(
        member: widget.member,
        text: texte,
        image: selectedImage,
      );

      textController.clear();
      setState(() {
        selectedImage = null;
      });
    } catch (e) {
      debugPrint('Error creating post: $e');
    }
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
                      decoration: const InputDecoration(
                        hintText: "Exprime-toi !",
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (selectedImage != null)
                      Image.file(
                        File(selectedImage!.path),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.photo_library),
                          onPressed: () => takePic(ImageSource.gallery),
                        ),
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () => takePic(ImageSource.camera),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        envoyerPost();
                      },
                      child: const Text("Envoyer"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
