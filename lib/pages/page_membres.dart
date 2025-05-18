import 'package:flutter/material.dart';

class PageMembres extends StatelessWidget {
  const PageMembres({super.key});

  final List<String> membres = const [
    'Jean-Mi',
    'Ch’tite Sophie',
    'Kevin du 62',
    'Léa la biloute',
    'Ahmed de Lille',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Membres"),
      ),
      body: ListView.builder(
        itemCount: membres.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(membres[index]),
            subtitle: const Text("Clique pour voir le profil"),
            onTap: () {
              // Action future : Naviguer vers le profil
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Profil de ${membres[index]} à venir !')),
              );
            },
          );
        },
      ),
    );
  }
}
