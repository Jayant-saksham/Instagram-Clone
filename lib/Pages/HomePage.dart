import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialMedia/Auth/Google.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSignedIn = false;
  Widget buildHomeScreen() {
    return MaterialButton(
      color: Colors.pink,
      onPressed: () => signOutGoogle(),
      child: Text("Logout"),
    );
  }

  Widget buildSignInScreen() {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Instagram",
                style:
                    GoogleFonts.oleoScript(fontSize: 90, color: Colors.white)),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                signInWithGoogle().then((result) {
                  if (result != null) {
                    setState(() {
                      isSignedIn = true;
                    });
                  } else {
                    print("BULL");
                  }
                });
              },
              child: Container(
                width: 270,
                height: 65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/goggle.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isSignedIn) {
      return buildHomeScreen();
    } else {
      return buildSignInScreen();
    }
  }
}
