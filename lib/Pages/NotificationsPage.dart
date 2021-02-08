import 'package:flutter/material.dart';
import 'package:socialMedia/Widgets/HeaderWidget.dart';
import 'package:socialMedia/Widgets/ProgessWidget.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(
        context,
        isApptitle: false,
        strTitle: "Notifications",
      ),
      body: circleProgess(),
    );
  }
}
