// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:socialMedia/Pages/CreateAccountPage.dart';

// GoogleSignIn googleSignIn = GoogleSignIn();
// final CollectionReference userReference =
//     Firestore.instance.collection("Users");

// class FirebaseFunctions {
//   saveUserInfoToFireStore() async {
//     final GoogleSignInAccount googleSignInAccount = googleSignIn.currentUser;
//     DocumentSnapshot documentSnapshot =
//         await userReference.document(googleSignInAccount.id).get();
//     if (!documentSnapshot.exists) {
//       final userName = await Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CreateAccountPage(),
//         ),
//       );
//       userReference.document(googleSignInAccount.id).setData({
//         "ID": googleSignInAccount.id,
//         "ProfielName": googleSignInAccount.displayName,
//         "UserName": userName,
//         "URL": googleSignInAccount.photoUrl,
//         "Email": googleSignInAccount.email,
//         "Bio": "",
//         "Timestamp": DateTime.now().toString(),
//       });
//       documentSnapshot =
//           await userReference.document(googleSignInAccount.id).get();
//       // currentUser = User.fromdocument(documentSnapshot);
//     }
//   }
// }
