// import 'package:flutter/material.dart';
// import '../modeles/notification.dart';

// class WidgetNotif extends StatelessWidget {
//   final NotificationModel notification;

//   const WidgetNotif({Key? key, required this.notification}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(Icons.notifications),
//       title: Text(notification.titre),
//       subtitle: Text(notification.message),
//       trailing: Text(
//         '${notification.date.hour.toString().padLeft(2, '0')}:${notification.date.minute.toString().padLeft(2, '0')}',
//         style: Theme.of(context).textTheme.caption,
//       ),
//       onTap: notification.lu ? null : () {
//         // marquer comme lu...
//       },
//     );
//   }
// }
