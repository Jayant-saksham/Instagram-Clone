import 'package:flutter/material.dart';
import 'package:socialMedia/Widgets/HeaderWidget.dart';

class TimeLinePage extends StatefulWidget {
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(
        context,
        isApptitle: true,
      ),
    );
  }
}
