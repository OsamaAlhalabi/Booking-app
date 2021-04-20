import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

InputDecoration kInputField = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10),
    fillColor: Colors.white.withAlpha(200),
    filled: true,
    errorStyle: TextStyle(fontFamily: 'Patrick'),
    hintStyle:
        TextStyle(fontSize: 16, color: Colors.black54, fontFamily: 'Sans'),
    prefixIcon: Icon(
      LineIcons.search,
      color: Color(0xFFCE832D).withOpacity(0.8),
      size: 24,
    ),
    border: outlineBorder,
    enabledBorder: outlineBorder,
    focusedBorder: outlineBorder);

final outlineBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(10),
);

TextStyle kFieldTitle = TextStyle(
    fontFamily: 'Patrick',
    fontSize: 18,
    color: Colors.black.withOpacity(0.8),
    fontWeight: FontWeight.bold);

TextStyle kCardTitle = TextStyle(
  fontSize: 26.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontFamily: 'Patrick',
);

TextStyle kInputText = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: Colors.black87,
  fontFamily: 'Sans',
);

ShapeBorder kBackButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);

final kHotelCard = TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sans');

final kBlueColor = Color(0xFF2A6CDC);
final kGoldColor = Color(0xFFE0B84C);
