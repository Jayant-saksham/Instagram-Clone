import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar header(
  context, {
  bool isApptitle = false,
  String strTitle,
  bool disableBackButton = false,
}) {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    automaticallyImplyLeading: disableBackButton ? false : true,
    centerTitle: true,
    title: Text(
      isApptitle ? "Instagram" : strTitle,
      style: isApptitle
          ? GoogleFonts.oleoScript(
              color: Colors.white,
              fontSize: 35,
            )
          : TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
      overflow: TextOverflow.ellipsis,
    ),
    backgroundColor: Theme.of(context).accentColor,
  );
}
