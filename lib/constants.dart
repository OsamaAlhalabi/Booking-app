import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

InputDecoration kInputField = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10),
    fillColor: Colors.blueGrey.withAlpha(600),
    filled: true,
    
    hintStyle: TextStyle(
        fontSize: 16,
        color: Colors.white.withOpacity(0.5),
        fontFamily: 'Sans'),
    prefixIcon: Icon(
      LineIcons.search,
      color: Colors.blueGrey.withOpacity(0.9),
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
  fontFamily: 'Sans',
  fontSize: 18,
  color: Colors.white.withOpacity(0.8)
);

TextStyle kCardTitle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'Sans',
);

TextStyle kInputText = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontFamily: 'Sans',
);

