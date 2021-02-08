import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialMedia/Auth/Google.dart';
import 'TimeLinePage.dart';
import 'NotificationsPage.dart';
import 'SearchPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ProfilePage.dart';
import 'UploadPage.dart';
import 'package:flutter/cupertino.dart';
import 'CreateAccountPage.dart';

GoogleSignIn googleSignIn = GoogleSignIn();
final DateTime timestamp = DateTime.now();
// GoogleSignIn googleSignIn = GoogleSignIn();
final CollectionReference userReference =
    Firestore.instance.collection("Users");

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  whenPageChanges(int pageIndex) {
    this.getPageIndex = pageIndex;
  }

  saveUserInfoToFireStore(GoogleSignInAccount googleSignInAccount) async {
    DocumentSnapshot documentSnapshot =
        await userReference.document(googleSignInAccount.id).get();
    if (!documentSnapshot.exists) {
      final userName = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateAccountPage(),
        ),
      );
      userReference.document(googleSignInAccount.id).setData({
        "ID": googleSignInAccount.id,
        "ProfileName": googleSignInAccount.displayName,
        "UserName": userName,
        "URL": googleSignInAccount.photoUrl,
        "Email": googleSignInAccount.email,
        "Bio": "",
        "Timestamp": DateTime.now().toString(),
      });
      documentSnapshot =
          await userReference.document(googleSignInAccount.id).get();
      // currentUser = User.fromdocument(documentSnapshot);
    } else {
      print("User already exist in database");
    }
  }

  void onTapChange(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );
  }

  bool isSignedIn = false;
  int getPageIndex = 0;
  PageController pageController;
  Widget buildHomeScreen() {
    return Scaffold(
      body: PageView(
        children: [
          TimeLinePage(),
          SearchPage(),
          UploadPage(),
          NotificationsPage(),
          ProfilePage(),
        ],
        controller: pageController,
        onPageChanged: whenPageChanges,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: getPageIndex,
        onTap: onTapChange,
        activeColor: Colors.white,
        backgroundColor: Theme.of(context).accentColor,
        inactiveColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera, size: 37),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  Widget buildSignInScreen() {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Instagram",
              style: GoogleFonts.oleoScript(
                fontSize: 90,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                await signInWithGoogle(context).then((result) async {
                  if (result != null) {
                    await saveUserInfoToFireStore(result);
                    setState(() {
                      isSignedIn = true;
                    });
                  } else {
                    setState(() {
                      isSignedIn = false;
                    });
                    print("NULL");
                  }
                });
              },
              child: Container(
                width: 270,
                height: 65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/goggle.png",
                    ),
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
