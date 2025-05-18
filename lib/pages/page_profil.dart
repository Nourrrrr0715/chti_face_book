import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services_firebase/service_firestore.dart';
import '../widgets/widget_post.dart';

class PageProfil extends StatelessWidget {
  const PageProfil({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final firestore = ServiceFirestore();

    if (uid == null) {
      return const Center(child: Text("Utilisateur non connecté"));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Mon profil")),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('membres').doc(uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("Profil introuvable"));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final prenom = data['prenom'] ?? '';
          final nom = data['nom'] ?? '';
          final description = data['description'] ?? '';
          final photo = data['photo'] ?? '';

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: photo != '' ? NetworkImage(photo) : null,
                  child: photo == '' ? const Icon(Icons.person, size: 40) : null,
                ),
                const SizedBox(height: 10),
                Text("$prenom $nom", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(description, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                const Divider(),

                // Posts du membre
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Mes publications", style: TextStyle(fontSize: 18)),
                  ),
                ),
                StreamBuilder(
                  stream: firestore.postForMember(uid),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    final docs = (snapshot.data! as QuerySnapshot).docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final postData = docs[index].data() as Map<String, dynamic>;
                        return PostWidget(data: postData);
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
