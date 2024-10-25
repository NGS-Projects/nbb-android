import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    Map payload = {};
    var data = Get.arguments;
    if (data is RemoteMessage) {
      payload = data.data;
    }
    if (data is NotificationResponse) {
      payload = jsonDecode(data.payload!);
    }
    // final data = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Message"),
      ),
      body: Center(child: Text(payload.toString())),
    );
  }
}
