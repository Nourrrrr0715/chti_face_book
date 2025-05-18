import 'package:chti_face_bouc/modeles/membre.dart';
import 'package:chti_face_bouc/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services_firebase/service_firestore.dart';

class PageProfil extends StatefulWidget {
  final Membre membre;
  const PageProfil({super.key, required this.membre});

  @override
  State<PageProfil> createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mon profil")),
      body: StreamBuilder<DocumentSnapshot>(
        stream: ServiceFirestore().specificMember(widget.membre.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("Profil introuvable"));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Avatar(radius: 40, url: widget.membre.profilePicture),
                const SizedBox(height: 10),
                Text(
                  widget.membre.name + " " + widget.membre.surname,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.membre.description,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                const Divider(),

                // Posts du membre
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mes publications",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                // StreamBuilder(
                //   stream: firestore.postForMember(uid),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData) {
                //       return const CircularProgressIndicator();
                //     }
                //     final docs = (snapshot.data!).docs;
                //     return ListView.builder(
                //       shrinkWrap: true,
                //       physics: const NeverScrollableScrollPhysics(),
                //       itemCount: docs.length,
                //       itemBuilder: (context, index) {
                //         final postData =
                //             docs[index].data() as Map<String, dynamic>;
                //         return PostWidget(data: postData);
                //       },
                //     );
                //   },
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
