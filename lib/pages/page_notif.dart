import 'package:flutter/material.dart';

class PageNotif extends StatelessWidget {
  const PageNotif({super.key});

  final List<String> notifications = const [
    "Jean-Mi a aimé ton post.",
    "Ch’tite Sophie a commenté : « Trop stylé ! »",
    "Tu as un nouveau follower : Kevin du 62.",
    "Ton post a été partagé 2 fois.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(notifications[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notification : ${notifications[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}
