import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialMedia/Widgets/HeaderWidget.dart';

final CollectionReference userReference =
    Firestore.instance.collection("Users");

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextEditingController = TextEditingController();
  Future<QuerySnapshot> futureSearchResults;
  clearTextFormField() {
    searchTextEditingController.clear();
  }

  void controlSearching(String str) {
    Future<QuerySnapshot> allUsers = userReference
        .where("ProfileName", isGreaterThanOrEqualTo: str)
        .getDocuments();

    setState(() {
      futureSearchResults = allUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextFormField(
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          controller: searchTextEditingController,
          decoration: InputDecoration(
            hintText: "Seach here...",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            prefixIcon: Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 30,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: clearTextFormField,
              color: Colors.white,
            ),
          ),
          onFieldSubmitted: controlSearching,
        ),
      ),
    );
  }
}
