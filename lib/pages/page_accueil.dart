import 'package:flutter/material.dart';
import '../services_firebase/service_firestore.dart';
import '../widgets/widget_post.dart';
import '../widgets/widget_vide.dart';

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = ServiceFirestore();

    return Scaffold(
      // AppBar bleue 
      appBar: AppBar(title: const Text("Accueil")),
      body: StreamBuilder(
        stream: firestore.allPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const WidgetVide(titre: "Aucun post");
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              return PostWidget(data: data);
            },
          );
        },
      ),
    );
  }
}
