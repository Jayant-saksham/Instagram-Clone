import 'package:flutter/material.dart';
import 'package:socialMedia/Widgets/HeaderWidget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(
        context,
        isApptitle: false,
        strTitle: "Profile",
      ),
    );
  }
}
