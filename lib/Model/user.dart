import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String profileName;
  final String userName;
  final String url;
  final String email;
  final String bio;
  User({
    this.bio,
    this.email,
    this.id,
    this.profileName,
    this.url,
    this.userName,
  });
  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      email: doc['email'],
      url: doc['photoUrl'],
      profileName: doc['displayName'],
      bio: doc['bio'],
    );
  }
}
